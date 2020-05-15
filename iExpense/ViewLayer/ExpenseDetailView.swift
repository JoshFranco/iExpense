//
//  ExpenseDetailView.swift
//  iExpense
//
//  Created by Josh Franco on 5/14/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import SwiftUI

struct ExpenseDetailView: View {
    var name: String
    var type: ExpenseItem.ExpenseType
    var amount: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text(type.rawValue)
            }
            
            Spacer()
            
            Text("$\(amount)")
                .if(Int.min...10 ~= amount) { $0.lowExpenseStyle() }
                .if(10...100 ~= amount, content: { $0.medExpenseStyle() })
                .if(100...Int.max ~= amount, content: { $0.highExpenseStyle() })
        }
    }
}

struct ExpenseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseDetailView(name: "Food", type: .personal, amount: 12)
    }
}
