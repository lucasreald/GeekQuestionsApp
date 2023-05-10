//
//  QuestionsViewModel.swift
//  GeekQuestions
//
//  Created by Lucas Real Dias on 10/05/23.
//

import Foundation
import SwiftUI

class QuestionsViewModel: ObservableObject {

    // Sound
    @Published var isMusicOn: Bool = true

    // Sheet
    @Published var showSheet = false // End game sheet

    // Button animation
    @Published var animationAmount = 0.0
    @Published var flipIndex = -1
    @Published var anwserColor = Color("color4")

    // Questions logic
    @Published var answered = false
    @Published var questionCounter = 0
    @Published var currentQuestionIndex = 0
    @Published var score = 0
    @Published var disabledAnswerIndexes: [Int] = []
    @Published var usedQuestionIndexes: [Int] = []

    var shuffledQuestions = questions.shuffled()

    var currentQuestion: Questions {
        shuffledQuestions[currentQuestionIndex]
    }

    func checkAnswer(_ answerIndex: Int) -> Bool {
        let answer = currentQuestion.alternatives[answerIndex]
        if answer.correct {
            score += 1
        }
        return answer.correct
    }

    func nextQuestion() {
        withAnimation(.easeInOut){
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            }
        }
    }

    func endGame() {
        showSheet.toggle()
    }
}
