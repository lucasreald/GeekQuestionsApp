//
//  ResultingScreen.swift
//  GeekQuestions
//
//  Created by Lucas Real Dias on 10/05/23.
//

import SwiftUI

struct ResultingScreen: View {

    // Quit button
    @Environment(\.dismiss) var dismiss

    // QuestionViewModel connection
    @EnvironmentObject var questionsViewModel : QuestionsViewModel

    // Sound
    @Binding var isMusicOn : Bool // Binding connection betwen screens

    // Callback quit sheet button
    var popViewCallback: (() -> Void)?

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("color1"), Color("color2")]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()

            VStack {
                (Text("Você acertou ")
                    .foregroundColor(Color("color3")) +
                 Text("\(questionsViewModel.score)")
                    .foregroundColor(.green) +
                 Text(" das 15 perguntas "))
                .foregroundColor(Color("color3"))
                .padding(.top, 30)
                .font(.custom("Righteous-Regular", size: 40))
                .multilineTextAlignment(.center)
                .frame(width: 250)

                Image("astronautSheet")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320, height: 320)

                HStack {
                    Button(action: {
                        questionsViewModel.score = 0
                        questionsViewModel.shuffledQuestions.shuffle()
                        questionsViewModel.currentQuestionIndex = 0
                        questionsViewModel.questionCounter = 0
                        questionsViewModel.showSheet.toggle()
                    }) {
                        Text("Restart ")
                        .buttonStyleEnd()
                    }

                    Button(action: {
                        dismiss()
                        popViewCallback?()
                    }) {
                        Text("Quit ")
                        .buttonStyleEnd()
                    }
                }
            }
        }
    }
}

struct ResultingGame_Previews: PreviewProvider {
    static var previews: some View {
        ResultingScreen(isMusicOn: .constant(false)).environmentObject(QuestionsViewModel())
    }
}
