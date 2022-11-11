//
//  TwitchView.swift
//  Memia
//
//  Created by Porter Dover on 11/11/22.
//

import SwiftUI
import HydraSwiftExtensions

struct TwitchView: View {
    
    @StateObject private var viewModel = PepePowerViewModel<[String : String]>()
    
    @State private var alertInfo = (title: "", message: "", isShowing: false)
    
    @State private var alertNewGame = (title: "", message: "", isShowing: false)
    
    var body: some View {
		ZStack {
			// Background fill
			LinearGradient(colors: [.indigo, .indigo, .mint, .mint], startPoint: .leading, endPoint: .trailing)
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
		// Fun alerts!
        .alert(alertInfo.title, isPresented: $alertInfo.isShowing) {
            Button("Continue") {
                viewModel.nextQuestion()
                if viewModel.quizComplete() {
                    alertNewGame.title = "You finished the quiz!"
                    alertNewGame.message = "You got \(viewModel.getScore())/\(viewModel.getQuestionsCount() + 1) questions correct!"
                    alertNewGame.isShowing = true
                }
            }
        } message: {
            Text(alertInfo.message)
        }
        .alert(alertNewGame.title, isPresented: $alertNewGame.isShowing) {
            Button("New Game") {
                viewModel.nextQuestion()
            }
            Button("Stop Playing") {
                alertInfo.title = "Okay. Then Quit."
                alertInfo.message = "Anytime now."
                alertInfo.isShowing = true
            }
        } message: {
            Text(alertNewGame.message)
        }
    }
    
    var imageGuy: some View {
        HStack {
            Button {
                viewModel.finishQuiz()
                alertNewGame.title = "You ended the quiz early? What the heck!"
                alertNewGame.message = "You got \(viewModel.getScore())/\(viewModel.getQuestionsCount() + 1) questions correct!"
                alertNewGame.isShowing = true
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .style(strokeColor: LinearGradient(colors: [.black, .purple, .black], startPoint: .leading, endPoint: .trailing), strokeWidth: 4, fill: LinearGradient(colors: [.blue, .cyan, .blue], startPoint: .leading, endPoint: .trailing))
                    Text("New Game")
                        .foregroundColor(.black)
                }
            }
            Image(uiImage: UIImage(imageLiteralResourceName: "twitch.png"))
                .resizable()
                .aspectRatio(contentMode: .fit)
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .style(strokeColor: LinearGradient(colors: [.black, .purple, .black], startPoint: .leading, endPoint: .trailing), strokeWidth: 4, fill:  LinearGradient(colors: [.blue, .cyan, .blue], startPoint: .leading, endPoint: .trailing))
                Text("Score: \(viewModel.getScore())")
                    .foregroundColor(.black)
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
			.foregroundColor(.black)
			.shadow(color: .white, radius: 1)
            .multilineTextAlignment(.center)
			// Other formatting
            .padding()
            .background(RoundedRectangle(cornerRadius: 25)
					.style(
						strokeColor: LinearGradient(colors: [.mint, .indigo], startPoint: .leading, endPoint: .trailing),
						strokeWidth: 4,
						fill:  LinearGradient(colors: [ .mint, Color(hex: "FFFFFF")! ], startPoint: .leading, endPoint: .trailing)
					)
			)
            .padding(.horizontal)
            .foregroundColor(.black)
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
								strokeColor: LinearGradient(colors: [.mint, .white, .indigo], startPoint: .leading, endPoint: .trailing),
								strokeWidth: 4, fill: LinearGradient(colors: [.cyan], startPoint: .leading, endPoint: .trailing))
						// Button text
                        Text(response)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .padding()
    }
    
}
