//
//  Diamond.swift
//  mySetGame
//
//  Created by ShinyMimikyu on 13/09/2020.
//

import SwiftUI

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let topMid = CGPoint(x: rect.midX, y: rect.minX)
        let bottomMid = CGPoint(x: rect.midX, y: rect.maxY)
        let leftMid = CGPoint(x: rect.minX, y: rect.midY)
        let rightMid = CGPoint(x: rect.maxX, y: rect.midY)
        p.move(to: topMid)
        p.addLine(to: leftMid)
        p.addLine(to: bottomMid)
        p.addLine(to: rightMid)
        p.addLine(to: topMid)
        return p
    }
}
