//
//  ViewController.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 15/03/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the title of the Nav Bar to be the App Logo.
        setNavTitle()
        
        // Set the text of the default 'Back' button (no text, just the arrow).
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        collection.delegate = self
        collection.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.Done
        
        // Start playing the background music.
        MusicPlayerSingleton.globalMusicPlayer.triggerMusicBg()
        parsePokemonCSV()
    }
    
    func setNavTitle() {
        let imageView = UIImageView(image: UIImage(named: "p-dex-logo"))
        imageView.contentMode = .ScaleAspectFit
        imageView.bounds.size.height = 30
        navigationItem.titleView = imageView
    }
    
    // Parse the Pokemon CSV file, and add the data (name, and id) to the Pokemon array.
    func parsePokemonCSV() {
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                let poke = Pokemon(name: name, pokedexId: pokeId)
                pokemon.append(poke)
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
            let poke: Pokemon!
            if inSearchMode {
                poke = filteredPokemon[indexPath.row]
            } else {
                poke = pokemon[indexPath.row]
            }
            cell.configureCell(poke)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    // Set the number of items (cells) in each section.
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode  {
            return filteredPokemon.count
        }
        return pokemon.count
    }
    
    // Set the number of sections of the collection view.
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Set the size of the collection view cells.
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(100, 116)
    }
    
    // Filter the items in the collection view based on the user's input in the search bar.
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            collection.reloadData()
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercaseString
            filteredPokemon = pokemon.filter({$0.name.rangeOfString(lower) != nil})
            collection.reloadData()
        }
    }
    
    // Dismiss the keyboard when the 'Done' button is pressed when using the search bar.
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    // Detect when the search bar becomes active.
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        if let sb = searchBar as? PokemonSearchBar {
            sb.beingEdited(true)
        }
    }
    
    // Detect when the search bar stops being active.
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        if let sb = searchBar as? PokemonSearchBar {
            sb.beingEdited(false)
        }
    }
    
    // Perform the appropriate segue when a cell is tapped.
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let poke: Pokemon!
        if inSearchMode {
            poke = filteredPokemon[indexPath.row]
        } else {
            poke = pokemon[indexPath.row]
        }
        // Remove focus from the search bar if it is empty.
        if searchBar.text == nil || searchBar.text == "" {
            searchBar.resignFirstResponder()
        }
        performSegueWithIdentifier("DetailSegue", sender: poke)
    }
    
    // Pass the Pokemon details to the DetailsVC when the segue is triggered.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailSegue" {
            if let pageVC = segue.destinationViewController as? DetailsPageVC {
                if let poke = sender as? Pokemon {
                    pageVC.selectedPokemon = poke
                }
            }
        }
    }
    
    // Play/Stop the music when the music button on the nav bar is tapped.
    @IBAction func musicButtonTapped(sender: UIBarButtonItem!) {
        MusicPlayerSingleton.globalMusicPlayer.triggerMusicBg()
        if let barButton = navigationItem.rightBarButtonItem {
            barButton.image = MusicPlayerSingleton.globalMusicPlayer.musicIcon
        }
    }
}

