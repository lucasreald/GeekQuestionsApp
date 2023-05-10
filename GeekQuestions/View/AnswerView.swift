//
//  AnswerView.swift
//  GeekQuestions
//
//  Created by Lucas Real Dias on 10/05/23.
//

import SwiftUI
import AVFoundation // Sound

struct AnswerView: View {

    // QuestionViewModel connection
    @ObservedObject var questionsViewModel : QuestionsViewModel

    var index : Int

    var body: some View {
        ZStack {
            if questionsViewModel.flipIndex == index {
                Text("\(index+1)) \(questionsViewModel.currentQuestion.alternatives[index].text)")
                    .buttonStyleQuestions()
                    .background(questionsViewModel.anwserColor)
                    .cornerRadius(12)
                    .rotation3DEffect(.degrees(questionsViewModel.animationAmount), axis: (x: 0, y: 1, z: 0))
            } else {
                Text("\(index+1)) \(questionsViewModel.currentQuestion.alternatives[index].text)")
                    .buttonStyleQuestions()
                    .background(Color("color4"))
                    .cornerRadius(12)
            }
        }
    }
}

struct QuestionsLineComponent_Previews: PreviewProvider {
    static var questionsViewModel : QuestionsViewModel = .init()
    static var previews: some View {
        AnswerView(questionsViewModel: questionsViewModel, index: 1).previewLayout(.fixed(width: 400, height: 100)).environmentObject(QuestionsViewModel())
    }
}
