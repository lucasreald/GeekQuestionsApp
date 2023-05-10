//
//  ContentScreen.swift
//  GeekQuestions
//
//  Created by Lucas Real Dias on 10/05/23.
//

import SwiftUI
import AVFoundation // Sound

struct ContentScreen: View {

    // Sound
    @Binding var isMusicOn: Bool // Binding connection between screens
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("color1"), Color("color2")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

                Image("geekLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 530, height: 530)
                    .padding(.top, -440)

                VStack {
                    Image("mainImg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 320, height: 320)
                        .shadow(color: .black, radius: 10)
                        .padding(.top, 90)

                    VStack(spacing: 20) {
                        NavigationLink {
                            QuestionsScreen(isMusicOn: $isMusicOn) // Binding connection betwen screens
                        } label: {
                            Text("Iniciar")
                                .buttonStyleMain()
                        }

                        NavigationLink {
                            AboutScreen(isMusicOn: $isMusicOn)
                        } label: {
                            Text("Sobre")
                                .buttonStyleMain()
                        }
                    }
                }
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentScreen(isMusicOn: .constant(true)).environmentObject(QuestionsViewModel())
    }
}
