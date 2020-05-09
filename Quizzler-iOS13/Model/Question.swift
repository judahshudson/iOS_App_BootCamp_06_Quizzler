//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Judah Hudson on 12/29/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let choices: [String] //MC
    let answer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        choices = a //MC
        answer = correctAnswer
    }
}
