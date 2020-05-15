//
//  Expenses.swift
//  iExpense
//
//  Created by Josh Franco on 5/14/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import Combine
import Foundation

class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] {
        didSet {
            UserDefaults.standard.items = items
        }
    }
    
    // MARK: - Init
    init() {
        self.items = UserDefaults.standard.items
    }
    
    init(using items: [ExpenseItem]) {
        self.items = items
    }
}
