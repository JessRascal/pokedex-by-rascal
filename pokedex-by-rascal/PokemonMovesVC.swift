//
//  PokemonMovesVC.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 24/03/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class PokemonMovesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pokemon: Pokemon!
    var moves: [Move]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        moves = pokemon.moves
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moves.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MoveCell") as? MoveCell {
            let move = moves[indexPath.row]
            cell.configureCell(move)
            return cell
        } else {
            return MoveCell()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Forced on to the main queue due to some obscure bug.
        // For details, see - http://stackoverflow.com/questions/28509252/performseguewithidentifier-very-slow-when-segue-is-modal
        dispatch_async(dispatch_get_main_queue(),{
            self.performSegueWithIdentifier("DisplayMoveDetails", sender: self.moves[indexPath.row])
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DisplayMoveDetails" {
            if let moveDetailVC = segue.destinationViewController as? MoveDetailsVC {
                if let move = sender as? Move {
                    moveDetailVC.selectedMove = move
                }
            }
        }
    }
    
}
