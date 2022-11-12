//
//  Acronym .swift
//  Memia
//
//  Created by Porter Dover on 11/11/22.
//

import SwiftUI

struct AcronymView: View {
    
    @StateObject private var viewModel = AcronymViewModel()
    @State private var response: String = ""
    
    @State private var alertInfo = (title: "", message: "", isShowing: false)
    
    @State private var alertNewGame = (title: "", message: "", isShowing: false)
    
    var body: some View {
        VStack {
            Spacer()
            title
                .frame(alignment: .top)
            Spacer()
            question
            Spacer()
            responseField
            Spacer()
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
    var title: some View {
        Text("NTABITEFY \n\n(Name That Acronym Because It's Totally Easy For You)")
            .font(.title)
            .multilineTextAlignment(.center)
            .padding()
    }
    var question: some View {
        Text("\(viewModel.getQuestion())")
    }
    var responseField: some View {
        HStack {
            VStack {
                TextField("Answer:", text: $response)
                Button {
                    if viewModel.checkAnswer(response: response.lowercased()) {
                        alertInfo.title = "That's correct!"
                        alertInfo.message = "You answered: \(response)"
                        alertInfo.isShowing = true
                        response = ""
                        
                    } else {
                        alertInfo.title = "Not Quite!"
                        alertInfo.message = "The correct answer was: \(viewModel.getAnswer())"
                        alertInfo.isShowing = true
                        response = ""
                    }
                } label: {
                    Text("Check Answer")
                }
            }
        } .padding(.horizontal)
    }
}

struct AcronymView_Previews: PreviewProvider {
    static var previews: some View {
        AcronymView()
    }
}
