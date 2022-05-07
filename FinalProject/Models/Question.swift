//
//  Question.swift
//  FinalProject
//
//  Created by Bishant Tripathi on 4/24/22.
//

import Foundation

struct Question {
    let text: String
    let choices: [String]
    let answer: String
    
    init(q: String, a: [String], correctAnswer: String){
        text = q
        choices = a
        answer = correctAnswer
    }
}
