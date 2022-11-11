//
//  TriviaGameViewModel.swift
//  Memia
//
//  Created by Porter Dover on 11/8/22.
//

import Foundation

class PepePowerViewModel <ResponseType : Collection> : ObservableObject {
    
    @Published private var quiz = MultipleChoiceQuiz<[String : String]>.pepeModel
    
    var currentQuestion: Question<[String : String]> {
        quiz.currentQuestion
    }
    
    func nextQuestion() {
        quiz.pickNewQuestion()
    }
    
    func quizComplete() -> Bool {
        quiz.quizComplete
    }
    
    func finishQuiz() {
        quiz.quizComplete = true
    }
    
    func getScore() -> Int {
        quiz.score
    }
    
    func getQuestionsCount() -> Int {
        quiz.badQuestions.count
    }
    
    func isCorrect(response: String) -> Bool {
        let isCorrect = currentQuestion.answer == response
        if isCorrect {
            quiz.score += 1
        }
        return isCorrect
    }
    
}
