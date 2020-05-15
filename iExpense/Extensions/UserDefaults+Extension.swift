//
//  UserDefaults+Extension.swift
//  iExpense
//
//  Created by Josh Franco on 5/14/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import Foundation

extension UserDefaults {
    private enum key: String {
        case items = "Expense_Items"
    }
    
    var items: [ExpenseItem] {
        get {
            guard
                let savedItems = self.data(forKey: key.items.rawValue),
                let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) else { return [] }
            
            return decoded
        } set {
            guard let encoded = try? JSONEncoder().encode(newValue) else { return }
            self.set(encoded, forKey: key.items.rawValue)
        }
    }
}
