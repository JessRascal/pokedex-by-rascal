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
    @IBOutlet weak var descriptionLabel: UILabel!
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
//        currentEvoButton.setImage(image, forState: .Normal)
        
        // Call the UpdateUI function once the downloading from the API has completed.
        pokemon.downloadPokemonDetails { () -> () in
            // This will be called after download is done.
            self.updateUI()
        }
    }
    
    // Update the UI with the selected Pokemon's details.
    func updateUI() {
        //descriptionLabel.text = pokemon.description // WHAT DATA IS THIS LINKED TO???
        typeLabel.text = pokemon.type
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        pokedexLabel.text = "\(pokemon.pokedexId)"
        weightLabel.text = pokemon.weight
        attackLabel.text = pokemon.attack
        
//        if pokemon.nextEvolutionId == "" {
//            evoLabel.text = "No Evolutions"
//            nextEvoButton.hidden = true
//        } else {
//            nextEvoButton.hidden = false
//            nextEvoButton.setImage(UIImage(named: pokemon.nextEvolutionId), forState: .Normal)
//            var str = "Next Evolution: \(pokemon.nextEvolutionText)"
//            if pokemon.nextEvolutionLevel != "" {
//                str += " (Level \(pokemon.nextEvolutionLevel))"
//                evoLabel.text = str
//            }
//        }
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
    
    // Go to the bio of the next evolution Pokemon when its button is tapped.
    @IBAction func nextEvoTapped(sender: AnyObject) {
        
    }
    
    // Dismiss the DetailsVC when the back button is tapped.
    @IBAction func backButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
//    @IBAction func segmentSwitchTapped(sender: AnyObject) {
//        var bio: Bool = true
//        var moves: Bool = false
//        
//        if segmentedControl.selectedSegmentIndex == 0 {
//            // 'Bio' segment selected.
//            bio = false
//            moves = true
//            
//        } else if segmentedControl.selectedSegmentIndex == 1 {
//            // 'Moves' segment selected.
//            bio = true
//            moves = false
//        }
//        
//        // Hide the relevant views depending on which segment is selected.
//        bioSV.hidden = bio
//        tableView.hidden = moves
//    }

}














