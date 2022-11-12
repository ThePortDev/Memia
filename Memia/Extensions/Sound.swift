//
//  Sound.swift
//  Memia
//
//  Created by Porter Dover on 11/12/22.
//

import Foundation
import AVFoundation

class Sounds {
    
    static var audioPlayer:AVAudioPlayer?
    
    static func playSounds(soundfile: String, numOfLoops: Int) {
        
        if let path = Bundle.main.path(forResource: soundfile, ofType: nil){
            
            do{
                
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
                audioPlayer?.numberOfLoops = numOfLoops
                
            }catch {
                print("Error")
            }
        }
    }
    
    static func stopSounds() {
        audioPlayer?.stop()
    }
}
