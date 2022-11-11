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
        ),
        Question(
            question: " What is r/damnthatsinteresting?",
            answer: "A subreddit that has extremely interesting things discussed by people on the subreddit.",
            extraResponses: [
                "A subreddit that has nothing to do with its name and is actually a subreddit full of empty void with absolutely nothing. Darkness is eternal. You are one with the void.",
                "A subreddit about interesting looking dams from around the world.",
                "A subreddit about interesting intercity roads."
            ]
        ),
        Question(
            question: "What is r/meirl?",
            answer: "A subreddit where people post things they relate to, mostly from twitter. Because well, twitter.",
            extraResponses: [
                "A subreddit that is about you. Irl. Fr fr no cap. Lmao",
                "A subreddit that is about mermaids but they look weird",
                "A subreddit that actually doesn't exist because it’s funny to add one that doesn't exist."
            ]
        ),
        Question(
            question: "What is r/funny?",
            answer: "A subreddit that is supposed to be “funny” but mostly just has old or bad jokes that don't make sense or aren’t actually funny.",
            extraResponses: [
                "A subreddit that is extremely funny and will make you laugh constantly, hahaha!",
                "A Do you even need another option? Just choose the right answer."
                
            ]
        ),
        Question(
            question: "What is r/blursed?",
            answer: "A subreddit where the object in question is neither blessed or cursed, so it’s “blursed",
            extraResponses: [
                "A subreddit based on gibberish where all the redditors speak in their own language and downvote others to oblivion otherwise.",
                "A subreddit that doesn’t exist because it’s funny to add one that doesn’t even exist.",
            ]
        ),
        Question(
            question: "What is r/cursedComments?",
            answer: "A subreddit that has funny comments that make you question your existence.",
            extraResponses: [
                "A subreddit that has really wholesome content.",
                "A subreddit that has extremely cool people that would never be socially inadequate.",
                "Why are you doing this quiz?"
            ])
        
    ])
    
    
}
