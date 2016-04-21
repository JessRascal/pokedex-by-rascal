//
//  MovesCell.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 17/03/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class MoveCell: UITableViewCell {

    @IBOutlet weak var moveName: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var accuracyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = UITableViewCellSelectionStyle.None
        backgroundColor = UIColor.appSecondaryColorTrans()
        moveName.textColor = UIColor.appAccentColor()
    }
    
    func configureCell(move: Move) {
        moveName.text = move.name
        powerLabel.text = move.power
        accuracyLabel.text = move.acc
    }

}
