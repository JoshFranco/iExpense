//
//  AddView.swift
//  iExpense
//
//  Created by Josh Franco on 5/14/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import SwiftUI

struct AddView: View {
    static let types: [ExpenseItem.ExpenseType] = [.business, .personal]
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type: ExpenseItem.ExpenseType = .personal
    @State private var amonut = ""
    @State private var alertTitle = ""
    @State private var alertMsg = ""
    @State private var showingAlert = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Expense Type")) {
                        Picker("Type", selection: $type) {
                            ForEach(Self.types, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("Expense Info")) {
                        TextField("Name", text: $name)
                        
                        TextField("Amount", text: $amonut)
                            .keyboardType(.numberPad)
                    }
                }
                
                Spacer()
                
                HStack(spacing: 16) {
                    Spacer()
                    
                    Button(action: saveNewExpense) {
                        Text("Save")
                            .frame(maxWidth: .infinity, maxHeight: 44)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    Spacer()
                }
            }
                
            .navigationBarTitle("Add New Expense")
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle),
                      message: Text(alertMsg),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}

// MARK: - Private
private extension AddView {
    func saveNewExpense() {
        guard
            !self.name.isEmpty,
            let actualAmount = Int(self.amonut) else {
                self.alertTitle = "Invalid Expense"
                self.alertMsg = "The Expense must have a name and a valid amount"
                self.showingAlert = true
                return
                
        }
        
        
        let newItem = ExpenseItem(name: self.name,
                                  type: self.type,
                                  amount: actualAmount)
        var updatedItems = self.expenses.items
        updatedItems.append(newItem)
        
        self.expenses.items = updatedItems
        self.presentationMode.wrappedValue.dismiss()
    }
}

// MARK: - Preview
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
