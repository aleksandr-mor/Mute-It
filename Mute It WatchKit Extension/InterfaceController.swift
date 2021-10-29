//
//  InterfaceController.swift
//  Mute It WatchKit Extension
//
//  Created by Aleksandr Morozov on 28.10.2021.
//

import WatchKit
import AVFoundation

var sound: AVAudioPlayer!

class InterfaceController: WKInterfaceController {
    
    override func willActivate() {
        
        let path = Bundle.main.path(forResource: "waterSound.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers])
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            } catch {
                print(error)
            }
            sound = try AVAudioPlayer(contentsOf: url)
        } catch {
            print(error)
        }
    }
    
    @IBAction func playSound() {
        if !sound.isPlaying { 
            sound.play()
        }
        else {sound.stop()}
    }
}

