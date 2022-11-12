//
//  ContentView.swift
//  Memia
//
//  Created by Porter Dover on 11/8/22.
//

import SwiftUI

struct TriviaGameView: View {
    
    @StateObject private var viewModel = MainMenuViewModel()
    
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
        }.accentColor(.black)
    }
    
    var currencyView: some View {
        NavigationLink(destination: ShopView(viewModel: viewModel).coinShop) {
            Text("Coins: " + "\(viewModel.coins)")
                .font(.title3)
                .padding()
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .style(strokeColor: .black, strokeWidth: 3, fill: .purple)
                )
        }
    }
    
    var twitchView: some View {
        NavigationLink(destination: TwitchView()) {
            Text("Twitch Quiz")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .style(strokeColor: .black, strokeWidth: 3, fill: .purple)
                )
        }
    }
    
    var redditView: some View {
        NavigationLink(destination: RedditView()) {
            Text("Reddit Quiz")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .style(strokeColor: .black, strokeWidth: 3, fill: .red)
                )
        }
    }
    var shopView: some View {
        NavigationLink(destination: ShopView(viewModel: viewModel)) {
            Text("Shop 🛒")
                .font(.title3)
                .padding()
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .style(strokeColor: .black, strokeWidth: 3, fill: .yellow)
                )
        }
    }
    var acronymView: some View {
        NavigationLink(destination: AcronymView()) {
            Text("Acronym Quiz \(!viewModel.paid ? "🔒" : "")")
                .padding()
                .font(.largeTitle)
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .style(strokeColor: .black, strokeWidth: 3, fill: LinearGradient(colors: [.blue, .yellow, .red, .orange, .purple, .cyan, .green, .mint, .pink], startPoint: .leading, endPoint: .trailing))
                )
                .opacity(!viewModel.paid ? 0.5 : 1)
        } .disabled(!viewModel.paid)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaGameView()
    }
}
