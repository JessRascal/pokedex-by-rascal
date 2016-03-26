//
//  MovesModel.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 18/03/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import Foundation
import Alamofire

class Move {
    private var _moveUrl: String!
    private var _name: String!
    private var _desc: String!
    private var _accuracy: String!
    private var _power: String!
    
    // Data encapsulation.
    var url: String {
        return _moveUrl
    }
    
    var name: String {
        return _name
    }
    
    var desc: String {
        return _desc
    }
    
    var acc: String {
        return _accuracy
    }
    
    var power: String {
        return _power
    }
    
    // Initialization.
    init(url: String, name: String, desc: String, acc: String, power: String) {
        _moveUrl = url
        _name = name
        _desc = desc
        _accuracy = acc
        _power = power
    }
}