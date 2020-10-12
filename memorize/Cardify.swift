//
//  Cardify.swift
//  memorize
//
//  Created by Rafael Freitas on 11/10/20.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    var isFaceUp: Bool = false
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
    }
    
    private let edgeLineWidth: CGFloat = 3
    private let cornerRadius: CGFloat = 10
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
