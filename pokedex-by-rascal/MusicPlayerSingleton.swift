//
//  MusicPlayerSingleton.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 25/03/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import Foundation

class MusicPlayerSingleton {
    static let globalMusicPlayer = AudioPlayer()
    private init() {} //This prevents others from using the default '()' initializer for this class.
}