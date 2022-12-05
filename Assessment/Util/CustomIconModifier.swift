//
//  CustomIconModifier.swift
//  Assessment
//
//  Created by Nagy Boldizsár on 2022. 11. 21..
//

import SwiftUI

struct CustomIconModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 8, weight: .semibold))
            .foregroundColor(Color.light)
    }
}
