//
//  ContentView.swift
//  Memia
//
//  Created by Porter Dover on 11/8/22.
//

import SwiftUI

struct TriviaGameView: View {
    
    var body: some View {
        
        NavigationView {
            HStack {
                NavigationLink(destination: TwitchView()) {
                    Text("Twitch Quiz")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .style(strokeColor: .black, strokeWidth: 3, fill: .white)
                        )
                }
				.navigationTitle("Pick A Quiz!")
                NavigationLink(destination: RedditView()) {
                    Text("Reddit Quiz")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .style(strokeColor: .black, strokeWidth: 3, fill: .white)
                        )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaGameView()
    }
}
