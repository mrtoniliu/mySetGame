//
//  Cardify.swift
//  Memorize
//
//  Created by ShinyMimikyu on 09/09/2020.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    func body(content: Content) -> some View {
        ZStack{
            Group{
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }
        }
    }
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}


extension View {
    func cardify() -> some View {
        self.modifier(Cardify())
    }
}
