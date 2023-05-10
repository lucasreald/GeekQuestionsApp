//
//  Sound.swift
//  GeekQuestions
//
//  Created by Lucas Real Dias on 10/05/23.
//

import Foundation
import AVFoundation // Sound import

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.volume = 0.05
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("Error")
        }
    }
}
