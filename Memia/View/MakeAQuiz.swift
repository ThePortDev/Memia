//
//  MakeAQuiz.swift
//  Memia
//
//  Created by Porter Dover on 11/11/22.
//

import Foundation
import SwiftUI

struct MakeAQuizView: View {
    
    @ObservedObject var viewModel: MainMenuViewModel
    
    @State private var answer: String = ""
    
    var body: some View {
        NavigationLink(destination: quizCreator) {
            Text("Create A New Quiz!")
        }
        Text("Sus")
            .font(.system(size: 150))
    }
    
    var quizCreator: some View {
        VStack {
            Text("Quiz Name:")
            HStack {
                Spacer()
                TextField("Enter Quiz Here:", text: $answer)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
    }
}
