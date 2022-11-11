//
//  ContentView.swift
//  Memia
//
//  Created by Porter Dover on 11/8/22.
//

import SwiftUI

struct TriviaGameView: View {
    
    @StateObject private var viewModel = PepePowerViewModel<[String : String]>()
    
    @State private var alertInfo = (title: "", message: "", isShowing: false)
    
    @State private var alertNewGame = (title: "", message: "", isShowing: false)
    
    var body: some View {
        
        NavigationView {
            NavigationLink(destination: twitchTestView) {
                Text("Pick A Quiz!")
            }
            .navigationTitle("Pick A Quiz!")
        }
    }
    
    var twitchTestView: some View {
        ZStack {
            LinearGradient(colors: [.indigo, .indigo, .indigo, .mint], startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            VStack(spacing: 15) {
                question
                    .shadow(color: .white, radius: 1)
                answers
                    .shadow(color: .white, radius: 1)
                imageGuy
            }
            .padding(.vertical)
        }
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
            .font(.title3)
            .fontDesign(.serif)
            .multilineTextAlignment(.center)
            .padding()
            .background(RoundedRectangle(cornerRadius: 25)
                .style(strokeColor: LinearGradient(colors: [.black, .purple, .black], startPoint: .leading, endPoint: .trailing), strokeWidth: 4, fill:  LinearGradient(colors: [.blue, .cyan, .blue], startPoint: .leading, endPoint: .trailing)))
            .padding(.horizontal)
            .foregroundColor(.black)
        
    }
    
    var answers: some View {
        VStack {
            ForEach(Array<String>(viewModel.currentQuestion.responses.keys), id: \.self) { response in
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
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                        
                            .style(strokeColor: LinearGradient(colors: [.black, .purple, .black], startPoint: .leading, endPoint: .trailing), strokeWidth: 4, fill: LinearGradient(colors: [.blue, .cyan, .blue], startPoint: .leading, endPoint: .trailing))
                        Text(response)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaGameView()
    }
}
