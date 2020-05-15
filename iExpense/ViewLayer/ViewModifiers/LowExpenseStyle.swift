//
//  LowExpenseStyle.swift
//  iExpense
//
//  Created by Josh Franco on 5/14/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import SwiftUI

struct LowExpenseStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.green)
    }
}

// MARK: - Extension
extension View {
    func lowExpenseStyle() -> some View {
        self.modifier(LowExpenseStyle())
    }
}

// MARK: - Preview
struct LowExpenseStyle_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
            .lowExpenseStyle()
    }
}
