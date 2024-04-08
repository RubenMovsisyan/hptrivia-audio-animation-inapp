//
//  Game.swift
//  HPTrivia
//
//  Created by Ruben Movsisyan on 4/7/24.
//

import Foundation
import SwiftUI

@MainActor
class Game: ObservableObject {
    @Published var gameScore = 0
    @Published var questionScore = 5
    @Published var recentScore = [0, 0, 0]
    
    private var allQuestions: [Question] = []
    private var answeredQuestions: [Int] = []
    
    var filteredQuestions: [Question] = []
    var currentQuestion = Consts.previewQuestion
    var answers: [String] = []
    var correctAnswer: String {
        currentQuestion.answers.first(where: { $0.value == true })!.key
    }
    
    init() {
        decodeQuestions()
    }
    
    func startGame() {
        self.gameScore = 0
        self.questionScore = 5
        self.answeredQuestions = []
    }
    
    func filterQuestions(to books: [Int]) {
        filteredQuestions = allQuestions.filter { books.contains($0.book) }
    }
    
    func newQuestion() {
        guard !filteredQuestions.isEmpty else { return }
        if answeredQuestions.count == filteredQuestions.count {
            answeredQuestions = []
        }
            
        var potentialQuestion = filteredQuestions.randomElement()!
        
        while answeredQuestions.contains(potentialQuestion.id) {
            potentialQuestion = filteredQuestions.randomElement()!
        }
        currentQuestion = potentialQuestion
        
        answers = []
        
        for answer in currentQuestion.answers.keys {
            answers.append(answer)
        }
        
        answers.shuffle()
        
        self.questionScore = 5
    }
    
    func correct() {
        answeredQuestions.append(currentQuestion.id)
        
        withAnimation {
            gameScore += questionScore
        }
    }
    
    func endGame() {
        recentScore[2] = recentScore[1]
        recentScore[1] = recentScore[0]
        recentScore[0] = gameScore
    }
    
    private func decodeQuestions() {
        if let url = Bundle.main.url(forResource: "trivia", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                allQuestions = try decoder.decode([Question].self, from: data)
                filteredQuestions = allQuestions
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
}
