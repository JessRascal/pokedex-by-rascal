//
//  PokemonEvoVC.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 24/03/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class PokemonEvoVC: UIViewController {
    
    @IBOutlet weak var currentEvoName: UILabel!
    @IBOutlet weak var currentEvoImage: CircleImageWithBorder!
    @IBOutlet weak var nextEvoImage: CircleImageWithBorder!
    @IBOutlet weak var nextEvoName: UILabel!
    @IBOutlet weak var nextEvoLevel: UILabel!
    @IBOutlet weak var spacingLabel: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        currentEvoName.text = pokemon.name.capitalizedString
        let currentImage = UIImage(named: "\(pokemon.pokedexId)")
        currentEvoImage.image = currentImage
        
        if pokemon.nextEvolutionId == "" {
            nextEvoImage.image = UIImage(named: "evoPlaceholder")
            nextEvoName.text = " "
            nextEvoLevel.hidden = true
            spacingLabel.hidden = true
        } else {
            nextEvoImage.image = UIImage(named: pokemon.nextEvolutionId)
            nextEvoName.text = pokemon.nextEvolutionText
            if pokemon.nextEvolutionLevel != "" {
                nextEvoLevel.text = "Level \(pokemon.nextEvolutionLevel)"
                spacingLabel.text = " "
            } else {
                nextEvoLevel.text = " "
                spacingLabel.text = " "
            }
        }
    }
}
