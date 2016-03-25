//
//  PokemonDetailVC.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 16/03/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class PokemonBioVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var currentEvoButton: UIButton!
    @IBOutlet weak var nextEvoButton: UIButton!
    @IBOutlet weak var evoLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var bioSV: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name.capitalizedString
        let image = UIImage(named: "\(pokemon.pokedexId)")
        mainImage.image = image
        
        // Call the UpdateUI function once the downloading from the API has completed.
        pokemon.downloadPokemonDetails { () -> () in
            // This will be called after download is done.
            self.updateUI()
        }
    }
    
    // Update the UI with the selected Pokemon's details.
    func updateUI() {
        descriptionText.text = pokemon.description // WHAT DATA IS THIS LINKED TO???
        typeLabel.text = pokemon.type
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        pokedexLabel.text = "\(pokemon.pokedexId)"
        weightLabel.text = pokemon.weight
        attackLabel.text = pokemon.attack
        
        // Set the description label to initially display starting at the top of its scroll.
        descriptionText.setContentOffset(CGPointZero, animated: false)
    }
    
    // TableView functions.
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        return MovesCell()
//        // Cell identifier = MovesCell
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1 // CHANGE
//    }

}














