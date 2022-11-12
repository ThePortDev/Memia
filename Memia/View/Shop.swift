//
//  Shop.swift
//  Memia
//
//  Created by Porter Dover on 11/11/22.
//

import SwiftUI

struct ShopView: View {
	
	@ObservedObject var viewModel: MainMenuViewModel
	
	var body: some View {
		//        NavigationLink(destination: coinShop) {
		VStack {
			
			Text("Buy Coins:")
				.font(.largeTitle)
				.font(.title3)
				.padding()
				.foregroundColor(.black)
//				.background(
//					RoundedRectangle(cornerRadius: 15)
//						.style(strokeColor: .black, strokeWidth: 3, fill: .purple)
//				)
			VStack {
				Text("This is a coin shop")
				Button {
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
	}
	//}
	
}
