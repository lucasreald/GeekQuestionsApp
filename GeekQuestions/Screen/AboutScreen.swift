//
//  AboutScreen.swift
//  GeekQuestions
//
//  Created by Lucas Real Dias on 10/05/23.
//

import SwiftUI
import AVFoundation // Sound

struct AboutScreen: View {

    // Sound
    @Binding var isMusicOn: Bool // Binding connection betwen screens

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("color1"), Color("color2")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

                VStack {
                    Text("Sobre ")
                        .font(.custom("Righteous-Regular", size: 60))
                        .foregroundColor(Color("color2"))
                        .padding(.bottom, 10)

                    Text("Teste seu conhecimento sobre o universo geek através de um Quiz com diversas perguntas do mundo dos games, filmes, series, animes e muito mais.")
                        .font(.custom("ChakraPetch-Medium", size: 22))
                        .multilineTextAlignment(.center)

                    Image("catAbout")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
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

struct About_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen(isMusicOn: .constant(true))
    }
}

