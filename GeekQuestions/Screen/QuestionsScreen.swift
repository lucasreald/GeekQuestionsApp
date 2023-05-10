//
//  QuestionsScreen.swift
//  GeekQuestions
//
//  Created by Lucas Real Dias on 10/05/23.
//

import SwiftUI
import AVFoundation // Sound

struct QuestionsScreen: View {

    // Quit sheet button
    @Environment(\.dismiss) var dismiss

    // QuestionViewModel connection
    @StateObject var questionsViewModel: QuestionsViewModel = .init()

    // Sound
    @Binding var isMusicOn: Bool // Binding connection between screens

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("color1"), Color("color2")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

                VStack(spacing: 10) {
                    QuestionsView()

                    (Text("Score: ")
                        .foregroundColor(Color("color3")) +
                     Text("\(questionsViewModel.score)")
                        .foregroundColor(.green))
                    .font(.custom("ChakraPetch-Medium", size: 28))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(7)
                    .padding(.bottom, 35)
                    .padding(.trailing, 5)
                }
                .padding(.top, 30)
            }

            // Sound options (on/off)
            .toolbar {
                  ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            if isMusicOn == true {
                                audioPlayer?.pause()
                            } else {
                                audioPlayer?.play()
                            }
                            isMusicOn.toggle()
                        } label: {
                            Text("Music")
                                .font(.custom("ChakraPetch-Medium", size: 20))
                            Label("Play", systemImage: isMusicOn ? "pause.circle.fill" : "play.circle.fill")
                        }
                  }
            }

            // End game sheet
            .fullScreenCover(isPresented: $questionsViewModel.showSheet) {
                ZStack {
                    Color("color1")

                    VStack {
                        // Navigation 'Sair' button
                        ResultingScreen(isMusicOn: $isMusicOn, popViewCallback: { // Callback
                            dismiss()
                        })
                    }
                }
            }
            .environmentObject(questionsViewModel)
        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsScreen(isMusicOn: .constant(true)).environmentObject(QuestionsViewModel())
    }
}
