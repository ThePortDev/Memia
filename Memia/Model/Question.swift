//
//  Question.swift
//  Memia
//
//  Created by Porter Dover on 11/8/22.
//

import Foundation

struct Question <ResponseType : Collection> {
    let question: String
    let answer: String
    let responses: ResponseType
    var numOfResponses: Int {
        responses.count
    }
}

extension Question where ResponseType == [String] {
    init(question: String, answer: String, extraResponses: [String]) {
        self.question = question
        self.answer = answer
        responses = extraResponses + [answer]
    }
}
//extension Question where ResponseType == [String : String] {
//    init(question: String, answer: String, allResponses: [String : String], description: String? = nil) {
//        self.question = question
//        self.answer = answer
//        responses = allResponses
//    }
//}
