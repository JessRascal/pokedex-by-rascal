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
    init(url: String) {
        _moveUrl = "\(URL_BASE)\(url)"
        downloadMoveDetails()
    }
    
    func downloadMoveDetails() { // NEED THE DOWNLOAD COMPLETE CLOSURE AS A PARAMETER????
        if let url = NSURL(string: _moveUrl) {
            Alamofire.request(.GET, url).responseJSON { response in
                let result = response.result
                
                // Get the Move's details
                if let dict = result.value as? Dictionary<String, AnyObject> {
                    
                    if let name = dict["name"] as? String {
                        self._name = name
                    }
                    
                    if let desc = dict["description"] as? String {
                        self._desc = desc
                    }
                    
                    if let accuracy = dict["accuracy"] as? Int {
                        self._accuracy = "\(accuracy)"
                    }
                    
                    if let power = dict["power"] as? Int {
                        self._power = "\(power)"
                    }
                    
                } // dict end.
            }
        }
    }
}