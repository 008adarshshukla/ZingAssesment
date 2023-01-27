//
//  OrderDetailsModel.swift
//  ZingAssesment
//
//  Created by Adarsh Shukla on 27/01/23.
//

import Foundation
import FirebaseFirestoreSwift

struct OrderDetailsModel: Codable {
    @DocumentID var id: String?
    var statusCode: Int
}
