//
//  MedExpenseStyle.swift
//  iExpense
//
//  Created by Josh Franco on 5/14/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import SwiftUI

struct MedExpenseStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.blue)
    }
}

// MARK: - Extension
extension View {
    func medExpenseStyle() -> some View {
        self.modifier(MedExpenseStyle())
    }
}

struct MedExpenseStyle_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
            .medExpenseStyle()
    }
}
