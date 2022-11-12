//
//  TwitchView.swift
//  Memia
//
//  Created by Porter Dover on 11/11/22.
//

import SwiftUI
import HydraSwiftExtensions
import AlertX

struct TwitchView: View {
	
	@StateObject private var viewModel = PepePowerViewModel<[String : String]>()
	
	@State private var alertInfo = (title: "", message: "", isShowing: false)
	
	@State private var alertNewGame = (title: "", message: "", isShowing: false)
	
	var body: some View {
		ZStack {
			// Background fill
			Color(hex: "#E3C0FF")
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
			AlertX(title: Text("\(alertInfo.title)"),
				   message: Text("\(alertInfo.message)"),
				   primaryButton: .default(Text("Continue"), action: {
				viewModel.nextQuestion()
				if viewModel.quizComplete() {
					alertNewGame.title = "You finished the quiz!"
					alertNewGame.message = "You got \(viewModel.getScore())/\(viewModel.getQuestionsCount() + 1) questions correct!"
					alertNewGame.isShowing = true
				}
			}),
				   theme: .defaultTheme,
				   animation: .classicEffect())
		})
		// New game alert
		.alertX(isPresented: $alertNewGame.isShowing, content: {
			AlertX(title: Text("\(alertNewGame.title)"),
				   message: Text("\(alertNewGame.message)"),
				   primaryButton: .default(Text("New Game"), action: {
				viewModel.nextQuestion()
			}),
				   secondaryButton: .default(Text("Stop Playing"), action: {
				alertInfo.title = "Okay, then Quit."
				alertInfo.message = "Anytime now."
				alertInfo.isShowing = true
			}),
				   theme: .defaultTheme,
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
							strokeColor: Color(hex: "#6441A5")!,
							strokeWidth: 4,
							fill:  LinearGradient(colors: [ Color(hex: "#6441a5")!, Color(hex: "#9146ff")!, Color(hex: "#6441a5")! ], startPoint: .leading, endPoint: .trailing)
						)
					Text("New Game")
						.foregroundColor(.white)
						.bold()
				}
			}
			// Image (self explanatory)
			Image(uiImage: UIImage(imageLiteralResourceName: "twitch.png"))
				.resizable()
				.aspectRatio(contentMode: .fit)
			// Score layout
			ZStack {
				RoundedRectangle(cornerRadius: 25)
					.style(
						strokeColor: Color(hex: "#6441A5")!,
						strokeWidth: 4,
						fill:  LinearGradient(colors: [ Color(hex: "#6441a5")!, Color(hex: "#9146ff")!, Color(hex: "#6441a5")! ], startPoint: .leading, endPoint: .trailing)
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
					strokeColor: Color(hex: "#6441A5")!,
					strokeWidth: 4,
					fill:  LinearGradient(colors: [ Color(hex: "#6441a5")!, Color(hex: "#9146ff")!, Color(hex: "#6441a5")! ], startPoint: .leading, endPoint: .trailing)
				)
			)
			.padding(.horizontal)
	}
	
	var answers: some View {
		VStack {
			ForEach(Array<String>(viewModel.currentQuestion.responses.keys), id: \.self) { response in
				// Button functionality
				Button {
					if viewModel.isCorrect(response: response) {
						alertInfo.title = "That's correct!"
						alertInfo.message = viewModel.currentQuestion.responses[response]!
						alertInfo.isShowing = true
						
					} else {
						alertInfo.title = "Not Quite!"
						alertInfo.message = viewModel.currentQuestion.responses[response]!
						alertInfo.isShowing = true
					}
					// Button label formatting
				} label: {
					ZStack {
						// Button background
						RoundedRectangle(cornerRadius: 25)
							.style(
								strokeColor: Color(hex: "#6441a5")!,
								strokeWidth: 4,
								fill: Color(hex: "#FFFFFF")!)
						// Button text
						Text(response)
							.font(.body)
							.fontDesign(.rounded)
							.foregroundColor(.black)
					}
				}
			}
		}
		.padding()
	}
	
}
