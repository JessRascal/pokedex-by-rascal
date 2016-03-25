//
//  Audio.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 25/03/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit
import AVFoundation

class AudioPlayer {
    
    private var _bgMusicPlayer: AVAudioPlayer!
    private var _musicIcon: UIImage!
    
    var bgMusicPlayer: AVAudioPlayer {
        return _bgMusicPlayer
    }
    
    var musicIcon: UIImage {
        return _musicIcon
    }
    
    init() {
        playBackgroundMusic()
    }
    
    func playBackgroundMusic() {
        let path = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!
        
        do {
            _bgMusicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path)!)
            _bgMusicPlayer.prepareToPlay()
            _bgMusicPlayer.numberOfLoops = -1
            _bgMusicPlayer.volume = 0.3
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    // Play or Stop the background music.
    func triggerMusicBg() {
        if bgMusicPlayer.playing {
            bgMusicPlayer.stop()
            _musicIcon = UIImage(named: "musicOff")
        } else {
            bgMusicPlayer.play()
            _musicIcon = UIImage(named: "musicOn")
        }
    }
}