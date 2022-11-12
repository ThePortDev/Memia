//
//  RedditViewModel.swift
//  Memia
//
//  Created by Porter Dover on 11/10/22.
//

import Foundation

class RedditViewModel <ResponseType : Collection> : ObservableObject {
    
    @Published private var quiz = MultipleChoiceQuiz<[String]>.redditModel
    
    var currentQuestion: Question<[String]> {
        quiz.currentQuestion
    }
    
    func nextQuestion() {
        quiz.pickNewQuestion()
    }
	
	func resetQuiz() {
		quiz = MultipleChoiceQuiz<[String]>.redditModel
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
