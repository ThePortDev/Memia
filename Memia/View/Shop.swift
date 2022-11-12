//
//  Shop.swift
//  Memia
//
//  Created by Porter Dover on 11/11/22.
//

import SwiftUI
import AVKit


var coolCoins = 0

struct ShopView: View {
    
    @State var audioPlayer: AVAudioPlayer!
    
    @ObservedObject var viewModel: MainMenuViewModel
    
    var body: some View {
        NavigationLink(destination: coinShop) {
            Text("Buy Coins:")
                .font(.largeTitle)
                .font(.title3)
                .padding()
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .style(strokeColor: .black, strokeWidth: 3, fill: .purple)
                )
        }
        Spacer()
        Text("ANY PURCHASE WILL PERMANENTLY REMOVE ADS.")
            .font(.title3)
            .padding()
            .foregroundColor(.black)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .style(strokeColor: .black, strokeWidth: 3, fill: .purple)
            )
            .bold()
            .frame(alignment: .bottom)
            .multilineTextAlignment(.center)
        
    }
    
    var coinShop: some View {
        VStack {
            Text("This is a coin shop")
            NavigationLink( destination: MainMenuView()) {
                Button {
                    Sounds.playSounds(soundfile: "nooo.mp3", numOfLoops: 0)
                    viewModel.getPaid()
                } label: {
                    Text("Rob Us")
                        .font(.title3)
                        .padding()
                        .foregroundColor(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .style(strokeColor: .black, strokeWidth: 3, fill: .purple)
                        )
                }
            }
        }
    }
    
}
