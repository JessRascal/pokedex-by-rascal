//
//  PokemonSearchBar.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 05/04/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class PokemonSearchBar: UISearchBar {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor.appSecondaryColorTrans()
    }
    
    // Change the background colour of the search bar depending on whether it is active, or not.
    func beingEdited(editMode: Bool) {
        if editMode == true {
            backgroundColor = UIColor.appSecondaryColor().colorWithAlphaComponent(0.8)
        } else {
            backgroundColor = UIColor.appSecondaryColorTrans()
        }
    }
}
