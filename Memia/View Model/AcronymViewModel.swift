//
//  AcronymViewModel.swift
//  Memia
//
//  Created by Porter Dover on 11/11/22.
//

import Foundation

class AcronymViewModel: ObservableObject {
    
    @Published private var quiz = TextInputQuiz.acronymModel
    
    var currentQuestion: AcronymInputQuestion {
        quiz.currentQuestion
    }
    
    func getScore() -> Int {
        quiz.score
    }
    
    func getQuestionsCount() -> Int {
        quiz.badQuestions.count
    }
    
    func getAnswer() -> String {
        quiz.currentQuestion.answer
    }
    
    func getQuestion() -> String {
        quiz.currentQuestion.question
    }
    
    func nextQuestion() {
        quiz.pickNewQuestion()
    }
    
    func quizComplete() -> Bool {
        quiz.quizComplete
    }
    
    func checkAnswer(response: String) -> Bool {
        let isCorrect = currentQuestion.answer == response
        if isCorrect {
            quiz.score += 1
        }
        return isCorrect
    }
}
