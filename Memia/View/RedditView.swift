//
//  RedditView.swift
//  Memia
//
//  Created by Porter Dover on 11/11/22.
//

import SwiftUI
import HydraSwiftExtensions
import AlertX

struct RedditView: View {
    
    @StateObject private var viewModel = RedditViewModel<[String]>()
    
	@State private var alertInfo = (title: "", message: "", isShowing: false)
	
	@State private var alertNewGame = (title: "", message: "", isShowing: false)
	
	var body: some View {
		ZStack {
			// Background fill
			Color(hex: "#ffffff")
			// maybe change to #333333
				.ignoresSafeArea()
			// Stack of views
			VStack(spacing: 15) {
				question
				answers
				imageGuy
			}
			.shadow( radius: 3, x: 0, y: 0)
			.padding(.vertical)
		}
		// XAlert!
		// Answer/continue button
		.alertX(isPresented: $alertInfo.isShowing, content: {
			AlertX(title: Text("\(alertInfo.title)").font(.title2).bold(),
				   message: Text("\(alertInfo.message)"),
				   primaryButton: .default(Text("Continue").font(.title2), action: {
				viewModel.nextQuestion()
				if viewModel.quizComplete() {
					alertNewGame.title = "You finished the quiz!"
					alertNewGame.message = "You got \(viewModel.getScore())/\(viewModel.getQuestionsCount() + 1) questions correct!"
					alertNewGame.isShowing = true
				}
			}),
				   theme: .custom(
						windowColor: Color(hex: "#FF6314")!,
						alertTextColor: Color(hex: "#ffffff")!,
						enableShadow: false,
						enableRoundedCorners: true,
						enableTransparency: false,
						cancelButtonColor: Color(hex: "#FF9647")!,
						cancelButtonTextColor: Color(hex: "#ffffff")!,
						defaultButtonColor: Color(hex: "#FF9647")!,
						defaultButtonTextColor: Color(hex: "#ffffff")!),
					animation: .classicEffect())
		})
		// New game alert
		.alertX(isPresented: $alertNewGame.isShowing, content: {
			AlertX(title: Text("\(alertNewGame.title)").font(.title2).bold(),
				   message: Text("\(alertNewGame.message)").font(.title2),
				   primaryButton: .default(Text("New Game").font(.title2), action: {
				/// reset model in viemodel.
				
				//viewModel.nextQuestion()
				viewModel.resetQuiz()
			}),
				   secondaryButton: .none,
				   theme: .custom(
					windowColor: Color(hex: "#FF6314")!,
					   alertTextColor: Color(hex: "#ffffff")!,
					   enableShadow: false,
					   enableRoundedCorners: true,
					   enableTransparency: false,
					   cancelButtonColor: Color(hex: "#FF9647")!,
					   cancelButtonTextColor: Color(hex: "#ffffff")!,
					   defaultButtonColor: Color(hex: "#FF9647")!,
					   defaultButtonTextColor: Color(hex: "#ffffff")!),
				   animation: .classicEffect())
		})
	}
	
	var imageGuy: some View {
		HStack {
			// End quiz
			Button {
				viewModel.finishQuiz()
				alertNewGame.title = "You ended the quiz early? What the heck!"
				alertNewGame.message = "You got \(viewModel.getScore())/\(viewModel.getQuestionsCount() + 1) questions correct!"
				alertNewGame.isShowing = true
			} label: {
				ZStack {
					RoundedRectangle(cornerRadius: 25)
						.style(
							strokeColor: Color(hex: "#FF6314")!,
							strokeWidth: 4,
							fill:  LinearGradient(colors: [ Color(hex: "#FF6314")!, Color(hex: "#FF9647")!, Color(hex: "#FF6314")! ], startPoint: .leading, endPoint: .trailing)
						)
					Text("New Game")
						.foregroundColor(.white)
						.bold()
				}
			}
			// Image (self explanatory)
			Image(uiImage: UIImage(imageLiteralResourceName: "reddit.png"))
				.resizable()
				.aspectRatio(contentMode: .fit)
			// Score layout
			ZStack {
				RoundedRectangle(cornerRadius: 25)
					.style(
						strokeColor: Color(hex: "#FF6314")!,
						strokeWidth: 4,
						fill:  LinearGradient(colors: [ Color(hex: "#FF6314")!, Color(hex: "#FF9647")!, Color(hex: "#FF6314")! ], startPoint: .leading, endPoint: .trailing)
					)
				Text("Score: \(viewModel.getScore())")
					.foregroundColor(.white)
					.bold()
			}
		}
		.frame(height: 50)
		.padding(.horizontal)
	}
	
	var question: some View {
		Text(viewModel.currentQuestion.question)
		// Text style formatting
			.font(.title3)
			.fontDesign(.rounded)
			.bold()
			.foregroundColor(.white)
			.shadow(radius: 1)
			.multilineTextAlignment(.center)
		// Other formatting
			.padding()
			.background(RoundedRectangle(cornerRadius: 25)
				.style(
					strokeColor: Color(hex: "#FF6314")!,
					strokeWidth: 4,
					fill:  LinearGradient(colors: [ Color(hex: "#FF6314")!, Color(hex: "#FF9647")!, Color(hex: "#FF6314")! ], startPoint: .leading, endPoint: .trailing)
				)
			)
			.padding(.horizontal)
	}
	
	var answers: some View {
		VStack {
			ForEach(Array<String>(viewModel.currentQuestion.responses), id: \.self) { response in
				// Button functionality
				Button {
					if viewModel.isCorrect(response: response) {
						alertInfo.title = "That's correct!"
						alertInfo.message = ""
						alertInfo.isShowing = true
						
					} else {
						alertInfo.title = "Not Quite!"
						alertInfo.message = ""
						alertInfo.isShowing = true
					}
					// Button label formatting
				} label: {
					ZStack {
						// Button background
						RoundedRectangle(cornerRadius: 25)
							.style(
								strokeColor: Color(hex: "#FF6314")!,
								strokeWidth: 4,
								fill: Color(hex: "#d7d7d7")!)
						// Button text
						Text(response)
							.font(.body)
							.fontDesign(.rounded)
							.foregroundColor(.black)
							.padding(.horizontal)
					}
				}
			}
		}
		.padding()
	}
}
