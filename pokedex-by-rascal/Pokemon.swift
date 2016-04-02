//
//  Pokemon.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 15/03/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionText: String!
    private var _nextEvolutionId: String!
    private var _nextEvolutionLevel: String!
    private var _pokemonUrl: String!
    private var _moveUrls = [String]()
    private var _moves = [Move]()
    
    // Getters (Data Encapsulation).
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var nextEvolutionText: String {
        if _nextEvolutionText == nil {
            _nextEvolutionText = ""
        }
        return _nextEvolutionText
    }
    
    var nextEvolutionId: String {
        if _nextEvolutionId == nil {
            _nextEvolutionId = ""
        }
        return _nextEvolutionId
    }
    
    var nextEvolutionLevel: String {
        if _nextEvolutionLevel == nil {
            _nextEvolutionLevel = ""
        }
        return _nextEvolutionLevel
    }
    
    var moveUrls: [String] {
        return _moveUrls
    }
    
    var moves: [Move] {
        return _moves
    }
    
    // Initialization.
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    // Retrieve the Pokemon data from the web API, and inform once complete using the closure.
    func downloadPokemonDetails(completed: DownloadComplete) {
        let url = NSURL(string: _pokemonUrl)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            // Get the Pokemon's bio details.
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0 {
                    if let name = types[0]["name"] {
                        self._type = name.capitalizedString
                    }
                    
                    if types.count > 1 {
                        for x in 1..<types.count {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalizedString)"
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                
                // Get the Pokemon's description.
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>] where descArr.count > 0 {
                    if let url = descArr[0]["resource_uri"] {
                        let nsurl = NSURL(string: "\(URL_BASE)\(url)")!
                        Alamofire.request(.GET, nsurl).responseJSON { response in
                            let desResult = response.result
                            
                            if let descDict = desResult.value as? Dictionary<String, AnyObject> {
                                if let description = descDict["description"] as? String {
                                    self._description = description
                                }
                            }
                            completed()
                        }
                        
                    } else {
                        self._description = ""
                    }
                } // descArr end.
                
                // Get the Pokemon's evolutions.
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>] where evolutions.count > 0 {
                    if let to = evolutions[0]["to"] as? String {
                        
                        // Can't support mega pokemon right now but api still has mega data.
                        if to.rangeOfString("mega") == nil {
                            if let uri = evolutions[0]["resource_uri"] as? String {
                                let newStr = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                                let num = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
                                
                                self._nextEvolutionId = num
                                self._nextEvolutionText = to
                                
                                if let lvl = evolutions[0]["level"] as? Int {
                                    self._nextEvolutionLevel = "\(lvl)"
                                }
                            }
                        }
                    }
                } // evolutions end.
                
                // Get the URLs of the Pokemon's moves.
                if let movesArr = dict["moves"] as? [Dictionary<String, AnyObject>] where movesArr.count > 0 {
                    for x in 0..<movesArr.count {
                        if let url = movesArr[x]["resource_uri"] as? String {
                            self._moveUrls.append(url)
                        }
                    }
                }
            } // dict end.
        }
    }
    
    func downloadMoveDetails(completed: MovesDownloadComplete) {
        // Get the Pokemon's move(s) data.
        for x in 0..<_moveUrls.count {
            
            var moveName = ""
            var moveDesc = ""
            var moveAcc = ""
            var movePower = ""
            
            let url = _moveUrls[x]
            let nsurl = NSURL(string: "\(URL_BASE)\(url)")!
            Alamofire.request(.GET, nsurl).responseJSON { response in
                let result = response.result
                
                // Get the Move's details
                if let dict = result.value as? Dictionary<String, AnyObject> {
                    
                    if let name = dict["name"] as? String {
                        // Remove the hyphens from the move's name.
                        let formattedName = name.stringByReplacingOccurrencesOfString("-", withString: " ")
                        moveName = formattedName.capitalizedString
                    }
                    
                    if let desc = dict["description"] as? String {
                        moveDesc = desc
                    }
                    
                    if let accuracy = dict["accuracy"] as? Int {
                        moveAcc = "\(accuracy)"
                    }
                    
                    if let power = dict["power"] as? Int {
                        movePower = "\(power)"
                    }
                    
                    let newMove = Move(url: url, name: moveName, desc: moveDesc, acc: moveAcc, power: movePower)
                    self._moves.append(newMove)
                    
                } // dict end.
                // Only signify completion once all of the GETs have been completed for ALL of the moves.
                if x == self._moveUrls.count - 1{
                    completed()
                }
            }
        } // for loop end.
    }
}