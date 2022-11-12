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
                questions.shuffle()
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
            ),
            AcronymInputQuestion(
                question: "BMGWL",
                answer: "busting my gut with laughter"
            ),
            AcronymInputQuestion(
                question: "BOGSAT",
                answer: "bunch of guys sitting around talking"
            ),
            AcronymInputQuestion(
                question: "BTDTGTTSAWIO",
                answer: "been there, done that, got the T-shirt and wore it out"
            ),
            AcronymInputQuestion(
                question: "BTWITIAILWY",
                answer: "by the way I think I am in love with you"
            ),
            AcronymInputQuestion(
                question: "DFLA",
                answer: "disenhanced four-letter acronym"
            ),
            AcronymInputQuestion(
                question: "DITYIM",
                answer: "did I tell you I’m depressed?"
            ),
            AcronymInputQuestion(
                question: "DWISNWID",
                answer: "do what I say not what I do"
            ),
            AcronymInputQuestion(
                question: "FMDIDGAD",
                answer: "frankly my dear I don’t give a damn"
            ),
        ]
    )
}
