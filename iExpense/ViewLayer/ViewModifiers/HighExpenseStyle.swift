//
//  HighExpenseStyle.swift
//  iExpense
//
//  Created by Josh Franco on 5/14/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import SwiftUI

struct HighExpenseStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.red)
    }
}

// MARK: - Extension
extension View {
    func highExpenseStyle() -> some View {
        self.modifier(HighExpenseStyle())
    }
}

struct HighExpenseStyle_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
            .highExpenseStyle()
    }
}
