//
//  AudioPlayerService.swift
//  TipCalculator
//
//  Created by Juan Sebastian Orozco Buitrago on 2/12/23.
//

import Foundation
import AVFoundation

protocol AudioPlayerServiceProtocol {
    func playSound()
}

final class DefaultAudioPlayer: AudioPlayerServiceProtocol {
    
    private var player: AVAudioPlayer?
    
    func playSound() {
        let path = Bundle.main.path(forResource: "click", ofType: "m4a")!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
}
