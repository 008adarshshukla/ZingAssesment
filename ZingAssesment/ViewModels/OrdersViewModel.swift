//
//  OrdersViewModel.swift
//  ZingAssesment
//
//  Created by Adarsh Shukla on 27/01/23.
//

import SwiftUI
import FirebaseFirestore

class OrdersViewModel: ObservableObject {
    @Published var order: OrderDetailsModel = OrderDetailsModel(statusCode: 1)
    private var db = Firestore.firestore()
    private var listenerRegistration: ListenerRegistration?
    @Published var timeRemaining = 200
    
    var color: Color {
        if order.statusCode == 1 {
            return Color(.green)
        }
        else if order.statusCode == 2 {
            return Color(.yellow)
        }
        else if order.statusCode == 3 {
            return Color(.yellow).opacity(0.5)
        }
        else if order.statusCode == 4 {
            return Color(.orange)
        }
        else {
            return Color(.red)
        }
    }
    
    var text: String {
        if order.statusCode == 1 {
            return "Accepted"
        }
        else if order.statusCode == 2 {
            return "\(timeRemaining)"
        }
        else if order.statusCode == 3 {
            return "Prepared"
        }
        else if order.statusCode == 4 {
            return "Dispatched"
        }
        else {
            return "Denied"
        }
    }
    
    public func unsubscribe() {
        if listenerRegistration != nil {
            listenerRegistration?.remove()
            listenerRegistration = nil
        }
    }
    
    public func subscribe() {
        if listenerRegistration == nil {
            listenerRegistration = db.collection("OrdersCollection").document("OrdersDocument").addSnapshotListener { [weak self] documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                
                do {
                    self?.order = try document.data(as: OrderDetailsModel.self)
                } catch {
                    print(error)
                }
            }
        }
    }
    
}
