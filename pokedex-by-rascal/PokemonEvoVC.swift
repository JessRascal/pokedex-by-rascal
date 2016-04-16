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
    @IBOutlet weak var evoArrow: UIImageView!
    
    @IBOutlet weak var currentEvoSV: UIStackView!
    @IBOutlet weak var currentEvoLabelsSV: UIStackView!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        currentEvoName.text = pokemon.name.capitalizedString
        let currentImage = UIImage(named: "\(pokemon.pokedexId)")
        currentEvoImage.image = currentImage
        
        evoArrow.image = nil
        
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
    
    // Function to change the evo arrow image with a fade effect.
    func changeArrowImage(imageName: String) {
        let image = UIImage(named: imageName)
        // Fade out the evoArrow.
        UIView.animateWithDuration(1, animations: {
            self.evoArrow.alpha = 0
            }, completion: {(finished: Bool) in
                // Change the evoArrow to the new image.
                self.evoArrow.image = image
                // Fade in the evoArrow.
                UIView.animateWithDuration(1, animations: {
                    self.evoArrow.alpha = 100
                })
        })
    }
    
    override func viewDidLayoutSubviews() {
        // Compact Height (w Any, h Compact) (e.g. iPhones in landscape).
        if self.view.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Compact {
            // Move the current evo labels to below the image.
            currentEvoSV.insertArrangedSubview(currentEvoImage, atIndex: 0)
            currentEvoLabelsSV.insertArrangedSubview(currentEvoName, atIndex: 0)
            
            // Change the evo arrow image to the landscape version.
            changeArrowImage("evoArrowLandscape")
            
        } else {
            // Move the current evo labels to above the image.
            currentEvoSV.insertArrangedSubview(currentEvoImage, atIndex: 2)
            currentEvoLabelsSV.insertArrangedSubview(currentEvoName, atIndex: 1)
            
            // Change the evo arrow image to the portrait version.
            changeArrowImage("evoArrowPortrait")
        }
    }
}
