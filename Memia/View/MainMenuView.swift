//
//  ContentView.swift
//  Memia
//
//  Created by Porter Dover on 11/8/22.
//

import SwiftUI
import HydraSwiftExtensions
import AVKit

struct MainMenuView: View {
    
    @StateObject private var viewModel = MainMenuViewModel()
    
    @State var audioPlayer: AVAudioPlayer!
      
    let sound = Bundle.main.path(forResource: "elevator", ofType: "mp3")

    var body: some View {
		NavigationView {
			ZStack {
				// Background color
				LinearGradient(colors: [.red, .orange, .yellow, .green, .cyan, .blue, .indigo, .purple], startPoint: .top, endPoint: .bottom)
					.opacity(0.75)
					.ignoresSafeArea()
				// VStack containing all views
				VStack(spacing: 50) {
					// Title and views
					Text("Quiz Whiz")
						.font(.largeTitle).bold()
						.foregroundColor(.black)
						.fontDesign(.rounded)
						.foregroundColor(.white)
					twitchView
					redditView
					acronymView
					//makeAQuiz
				// Coins and shop HStack
					HStack {
						shopView
						Spacer()
						//currencyView
					}
				}.padding(.horizontal)
			}.accentColor(.black)
		}
    }
    
	// Quiz views
    
  func playBackground() {
          Sounds.playSounds(soundfile: "elevator.mp3", numOfLoops: -1)
  }
	
	var twitchView: some View {
		NavigationLink(destination: TwitchView()) {
			ZStack {
				RoundedRectangle(cornerRadius: 15)
					.style(strokeColor: Color(hex: "#6441a5")!, strokeWidth: 3, fill: .white)
					.frame(height: 75)
				HStack {
					Image(uiImage: UIImage(imageLiteralResourceName: "twitch.png"))
								.resizable()
								.aspectRatio(contentMode: .fit)
								.frame(height: 50)
					Spacer()
					Text("Pepe Power")
						.font(.largeTitle)
						.foregroundColor(Color(hex: "#6441a5")!)
						.fontDesign(.rounded)
						.padding(.horizontal)
				}
			}
		}
	}
	
	var redditView: some View {
		NavigationLink(destination: RedditView()) {
			ZStack {
				RoundedRectangle(cornerRadius: 15)
					.style(strokeColor: Color(hex: "#FF6314")!, strokeWidth: 3, fill: .white)
					.frame(height: 75)
				HStack {
					Image(uiImage: UIImage(imageLiteralResourceName: "reddit.png"))
								.resizable()
								.aspectRatio(contentMode: .fit)
								.frame(height: 50)
					Spacer()
					Text("Read-It")
						.font(.largeTitle)
						.foregroundColor(Color(hex: "#FF6314")!)
						.fontDesign(.rounded)
						
				}.padding(.horizontal)
			}
		}
	}
	
	var acronymView: some View {
		NavigationLink(destination: AcronymView()) {
			
			ZStack {
				RoundedRectangle(cornerRadius: 15)
					.style(strokeColor: Color(hex: "#6441a5")!, strokeWidth: 3, fill: .white)
					.frame(height: 75)
				HStack {
					Text("NTABITEFY")
						.font(.largeTitle)
						.foregroundColor(Color(hex: "#6441a5")!)
						.fontDesign(.rounded)
						.padding(.horizontal)
					Spacer()
					Text("\(!viewModel.paid ? "🔒" : "")")
						.font(.largeTitle)
						.foregroundColor(Color(hex: "#6441a5")!)
						.fontDesign(.rounded)
						.padding(.horizontal)
						.opacity(!viewModel.paid ? 0.5 : 1)
				}
			}
		}.disabled(!viewModel.paid)
	}
	
	//    var makeAQuiz: some View {
	//        NavigationLink(destination: MakeAQuizView()) {
	//            Text("Make A Quiz!")
	//                .font(.largeTitle)
	//                .padding()
	//                .foregroundColor(.black)
	//                .background(
	//                    RoundedRectangle(cornerRadius: 15)
	//                        .style(strokeColor:.black, strokeWidth: 3, fill: LinearGradient(colors: [
	//							//.blue, .yellow, .red, .orange, .purple, .cyan, .green, .mint, .pink
	//							.red, .orange, .yellow, .green, .cyan, .blue, .indigo, .purple
	//						], startPoint: .leading, endPoint: .trailing))
	//                )
	//        }
	//    }
	
	// Store and coins views
	var shopView: some View {
		NavigationLink(destination: ShopView(viewModel: viewModel)) {
			ZStack {
				RoundedRectangle(cornerRadius: 15)
					.style(strokeColor: Color(hex: "#6441a5")!, strokeWidth: 3, fill: .white)
					.frame(height: 75)
				HStack {
					Text("Shop 🛒")
						.font(.title)
						.foregroundColor(Color(hex: "#6441a5")!)
						.fontDesign(.rounded)
				}
			}
		}.onAppear(perform: playBackground)
	}
	
    var currencyView: some View {
        NavigationLink(destination: ShopView(viewModel: viewModel)) {
			ZStack {
				RoundedRectangle(cornerRadius: 15)
					.style(strokeColor: Color(hex: "#6441a5")!, strokeWidth: 3, fill: .white)
					.frame(height: 75)
				HStack {
					Text("Coins: " + "\(viewModel.coins)")
						.font(.title)
						.foregroundColor(Color(hex: "#6441a5")!)
						.fontDesign(.rounded)
				}
			}
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
