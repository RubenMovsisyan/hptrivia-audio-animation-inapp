//
//  Question.swift
//  HPTrivia
//
//  Created by Ruben Movsisyan on 4/7/24.
//

import Foundation

struct Question: Codable {
    let id: Int
    let question: String
    var answers: [String: Bool] = [:]
    let book: Int
    let hint: String
    
    enum QuestionKeys: String, CodingKey {
        case id 
        case question
        case answer
        case wrong
        case book
        case hint
    }
    
    init(from decoder:  Decoder) throws {
        let container = try decoder.container(keyedBy: QuestionKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.question = try container.decode(String.self, forKey: .question)
        self.book = try container.decode(Int.self, forKey: .book)
        self.hint = try container.decode(String.self, forKey: .hint)
        
        let correctAnswer = try container.decode(String.self, forKey: .answer)
        
        answers[correctAnswer] = true
        
        let wrongAnswers = try container.decode([String].self, forKey: .wrong)
        
        for answer in wrongAnswers {
            answers[answer] = false
        }
        
    }
}
