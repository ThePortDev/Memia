//
//  ContentView.swift
//  Memia
//
//  Created by Porter Dover on 11/8/22.
//

import SwiftUI

struct TriviaGameView: View {
    
    @StateObject private var viewModel = MainMenuViewModel()
    
    @State var paidEnabled: Bool
    
    init(viewModel: MainMenuViewModel = MainMenuViewModel(), paidEnabled: Bool = false) {
        self.paidEnabled = viewModel.paid
    }
        
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                twitchView
                redditView
                acronymView
                Spacer()
                HStack {
                    shopView
                    Spacer()
                    currencyView
                }.padding()
            }
        }.accentColor(.black)
    }
    
    var currencyView: some View {
        NavigationLink(destination: ShopView().coinShop) {
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
        NavigationLink(destination: ShopView()) {
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
            Text("Acronym Quiz \(!paidEnabled ? "🔒" : "")")
                .padding()
                .font(.largeTitle)
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .style(strokeColor: .black, strokeWidth: 3, fill: LinearGradient(colors: [.blue, .yellow, .red, .orange, .purple, .cyan, .green, .mint, .pink], startPoint: .leading, endPoint: .trailing))
                )
                .opacity(!paidEnabled ? 0.5 : 1)
        } .disabled(!paidEnabled)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaGameView()
    }
}
