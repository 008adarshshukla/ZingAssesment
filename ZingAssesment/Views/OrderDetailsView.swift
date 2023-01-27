//
//  OrderDetailsView.swift
//  ZingAssesment
//
//  Created by Adarsh Shukla on 27/01/23.
//

import SwiftUI

struct OrderDetailsView: View {
    
    @StateObject var ordersViewModel = OrdersViewModel()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            Button {
                
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.cyan)
                    .frame(width: (UIScreen.main.bounds.width / 2) - 30, height: 50)
                    .overlay(alignment: .center) {
                        Text("Help")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
            }
            
            Button {
                
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(ordersViewModel.color)
                    .frame(width: (UIScreen.main.bounds.width / 2) - 30, height: 50)
                    .overlay(alignment: .center) {
                        Text(ordersViewModel.text)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
            }
            
        }
        .onReceive(timer) { _ in
            if ordersViewModel.timeRemaining > 0 {
                ordersViewModel.timeRemaining -= 1
            }
        }
        .onAppear {
            ordersViewModel.subscribe()
        }
    }
}

struct OrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailsView()
    }
}
