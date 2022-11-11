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
            VStack(spacing: 50) {
                NavigationLink(destination: TwitchView()) {
                    Text("Twitch Quiz")
                        .padding()
                        .foregroundColor(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .style(strokeColor: .black, strokeWidth: 3, fill: .purple)
                        )
                }
                NavigationLink(destination: RedditView()) {
                    Text("Reddit Quiz")
                        .padding()
                        .foregroundColor(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .style(strokeColor: .black, strokeWidth: 3, fill: .red)
                        )
                }
                NavigationLink(destination: AcronymView()) {
                    Text("Acronym Quiz")
                        .padding()
                        .foregroundColor(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .style(strokeColor: .black, strokeWidth: 3, fill: LinearGradient(colors: [.blue, .yellow, .red, .orange, .purple, .cyan, .green, .mint, .pink], startPoint: .leading, endPoint: .trailing))
                        )
                }
            }
        }.accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaGameView()
    }
}
