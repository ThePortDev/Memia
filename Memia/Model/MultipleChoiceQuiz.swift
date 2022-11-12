//
//  MultipleChoiceQuiz.swift
//  Memia
//
//  Created by Porter Dover on 11/8/22.
//

import Foundation

struct MultipleChoiceQuiz <ResponseType: Collection> {
    var questions: [Question<ResponseType>]
    var badQuestions: [Question<ResponseType>]
    var score = 0
    var quizComplete = false {
        didSet {
            if oldValue == true {
                questions = badQuestions
                questions.shuffle()
                score = 0
                badQuestions = []
                quizComplete.toggle()
            }
        }
    }
    
    var currentQuestion: Question<ResponseType>
    
    init(questions: [Question<ResponseType>], score: Int = 0, quizComplete: Bool = false) {
        self.questions = questions
        currentQuestion = self.questions.removeFirst()
        self.score = score
        self.quizComplete = quizComplete
        badQuestions = []
    }
    
    mutating func pickNewQuestion() {
        if !questions.isEmpty {
            badQuestions.append(currentQuestion)
            currentQuestion = questions.removeFirst()
        } else {
            quizComplete = true
        }
    }
}
