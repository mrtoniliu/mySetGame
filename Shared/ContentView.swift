//
//  ContentView.swift
//  Shared
//
//  Created by ShinyMimikyu on 12/09/2020.
//

import SwiftUI

struct ContentView: View {
    var deck: Deck = Deck()
    var gameModel: SetGameModel = SetGameModel()

    var body: some View {
        Text("Hello, world!, \(deck.numOfCards)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
