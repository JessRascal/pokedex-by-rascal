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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
    }
    
    func configureCell(move: Move) {
        moveName.text = move.name
    }

}
