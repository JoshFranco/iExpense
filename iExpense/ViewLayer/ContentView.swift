//
//  ContentView.swift
//  iExpense
//
//  Created by Josh Franco on 5/14/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses: Expenses
    @State private var showingAddExpense = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    ExpenseDetailView(name: item.name,
                                      type: item.type,
                                      amount: item.amount)
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    self.showingAddExpense.toggle()
                }) {
                    Image(systemName: "plus")
                }
            )
        }
    }
    
    // MARK: - Init
    init(with expenses: Expenses?) {
        self.expenses = expenses ?? Expenses()
    }
}

// MARK: - Private
private extension ContentView {
    func removeItems(at offsets: IndexSet) {
        var updatedItems = expenses.items
        updatedItems.remove(atOffsets: offsets)
        expenses.items = updatedItems
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static let previewItems = [ExpenseItem(name: "Ubur", type: .business, amount: 35),
                               ExpenseItem(name: "Food", type: .personal, amount: 10),
                               ExpenseItem(name: "Drinks", type: .personal, amount: 141)]
    
    static var previews: some View {
        ContentView(with: Expenses(using: previewItems))
    }
}
