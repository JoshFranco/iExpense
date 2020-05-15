//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Josh Franco on 5/14/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: ExpenseType
    let amount: Int
    
    enum ExpenseType: String, Codable {
        case business = "Business"
        case personal = "Personal"
    }
}
