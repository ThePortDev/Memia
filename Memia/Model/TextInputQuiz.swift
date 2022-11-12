//
//  TextInputQuiz.swift
//  Memia
//
//  Created by Porter Dover on 11/11/22.
//

import Foundation

struct TextInputQuiz {
    var questions: [AcronymInputQuestion]
    var currentQuestion: AcronymInputQuestion
    var score: Int = 0
    var badQuestions: [AcronymInputQuestion]
    var quizComplete = false {
        didSet {
            if oldValue == true {
                questions = badQuestions
                score = 0
                badQuestions = []
                quizComplete.toggle()
            }
        }
    }
    
    init(questions: [AcronymInputQuestion]) {
        self.questions = questions
        currentQuestion = self.questions.removeFirst()
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

extension TextInputQuiz {
    static let acronymModel = TextInputQuiz(
        questions: [
            AcronymInputQuestion(
                question: "ALOTBSOL",
                answer: "always look on the bright side of life"
            ),
            AcronymInputQuestion(
                question: "BFFLUDDUP",
                answer: "best friends for life until death do us part"
            )
        ]
    )
}
