//
//  SplashView.swift
//  GeekQuestions
//
//  Created by Lucas Real Dias on 10/05/23.
//

import SwiftUI
import AVFoundation // Sound

struct SplashView: View {

    // Sound
    @State var isMusicOn = true
    var player :  AVAudioPlayer!
    init() { // Sound initializing in background
        isMusicOn ? playSound(sound: "top-gear", type: "mp3") : audioPlayer?.stop()
    }

    @State var animate = false
    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.0
    var selectPage = 1

    var body: some View {
        if isActive {
            ContentScreen(isMusicOn: $isMusicOn)
                .transition(.opacity.animation(.easeInOut(duration: 1)))

        } else {
            ZStack {
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color("color1"), Color("color2")]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()

                    ZStack {
                        Image("geekLogo")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: animate ? .fill : .fit)
                            .frame(width: animate ? nil : 385, height: animate ? nil : 320)

                            // Scaling View
                            .scaleEffect(animate ? 6 : 1)

                            // Setting width to avoid over size
                            .frame(width: UIScreen.main.bounds.width)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 1.5
                            self.opacity = 1.0
                        }
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

