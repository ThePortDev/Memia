//
//  RedditModel.swift
//  Memia
//
//  Created by Porter Dover on 11/8/22.
//

import Foundation

extension MultipleChoiceQuiz where ResponseType == [String] {
    static let redditModel = MultipleChoiceQuiz(questions: [
        Question(
            question: "What is r/Memes?",
            answer: "A subreddit about memes",
            extraResponses: [
                "A subreddit about everything except memes",
                "A subreddit about your mom",
                "A subreddit you don't know about."
            ]
        ),
        Question(
            question: "What is r/EyeBleach?",
            answer: "A really cute subreddit full of happy cute things.",
            extraResponses: [
                "A subreddit that you’ll want to bleach your eyes after looking at.",
                "A subreddit where people photoshop bleach onto random objects that look funny",
                "A subreddit that actually is a link to the dark web and you can buy bleached eyes from."
            ]
        )
    ])
}
