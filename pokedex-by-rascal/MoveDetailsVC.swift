//
//  MoveDetailsVC.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 31/03/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class MoveDetailsVC: UIViewController {
    
    
    @IBOutlet weak var moveName: UILabel!
    @IBOutlet weak var movePower: UILabel!
    @IBOutlet weak var moveAccuracy: UILabel!
    @IBOutlet weak var moveDesc: UITextView!
    @IBOutlet var mainView: UIView!
    
    var selectedMove: Move!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moveName.text = selectedMove.name
        movePower.text = selectedMove.power
        moveAccuracy.text = selectedMove.acc
        moveDesc.text = selectedMove.desc
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        mainView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Fade the view on to the screen.
        UIView.animateWithDuration(0.5, animations: {
            self.mainView.alpha = 1
            }, completion: nil)
    }
    
    // Ensures the description UITextView starts off scrolled to the top.
    override func viewDidLayoutSubviews() {
        self.moveDesc.setContentOffset(CGPointZero, animated: false)
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
        // Fade the view out and dismiss the VC.
        UIView.animateWithDuration(0.5, animations: {
            self.mainView.alpha = 0
            }, completion: {(finished: Bool) in
                self.dismissViewControllerAnimated(false, completion: nil)
        })
    }
}
