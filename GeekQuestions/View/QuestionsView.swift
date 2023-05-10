//
//  QuestionsView.swift
//  GeekQuestions
//
//  Created by Lucas Real Dias on 10/05/23.
//

import SwiftUI
import AVFoundation // Sound

struct QuestionsView: View {

    // QuestionViewModel connection
    @EnvironmentObject var questionsViewModel : QuestionsViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 15) {
                    Text(questionsViewModel.currentQuestion.question)
                        .multilineTextAlignment(.center)
                        .frame(width: 340, height: 110)
                        .foregroundColor(Color("color3"))
                        .font(.custom("ChakraPetch-Medium", size: 24))
                        .padding(2)

                    ForEach(questionsViewModel.currentQuestion.alternatives.indices, id: \.self) { index in
                        Button(action: {
                            questionsViewModel.questionCounter += 1
                            // Animation logic
                            let result = questionsViewModel.checkAnswer(index)
                            questionsViewModel.flipIndex = index
                            questionsViewModel.anwserColor = result == true ? Color("correctAnswer") : Color("wrongAnswer")
                            withAnimation {
                                questionsViewModel.animationAmount += 360
                                questionsViewModel.answered = true
                                // Return to original color after flipping
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) { // Delay
                                    questionsViewModel.answered = false
                                    questionsViewModel.anwserColor = Color("color4")
                                    // Questions repetition
                                    if questionsViewModel.questionCounter < 15 {
                                        questionsViewModel.nextQuestion()
                                    } else {
                                        questionsViewModel.endGame()
                                    }
                                }
                            }
                        }) {
                            // Each button
                            AnswerView(questionsViewModel: questionsViewModel, index: index)
                        }
                        .shadow(color: .black, radius: 3)
                        .disabled(questionsViewModel.answered)
                    }
                }
            }
            .padding(.top, 30)
        }
    }
}

struct QuestionsComponent_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView().previewLayout(.fixed(width: 400, height: 600)).environmentObject(QuestionsViewModel())
    }
}
