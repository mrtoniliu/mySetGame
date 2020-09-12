//
//  CardView.swift
//  mySetGame
//
//  Created by ShinyMimikyu on 12/09/2020.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack{
        Diamond()
            .stroke(lineWidth: 2.0)
            .padding()
            .cardify()
        Circle()
            .stroke(lineWidth: 2.0)
            .padding()
            .cardify()
        Text("New Game")
        }
        
            
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
