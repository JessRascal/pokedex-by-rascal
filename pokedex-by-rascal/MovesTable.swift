//
//  MovesTable.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 05/04/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class MovesTable: UITableView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Remove the separator lines in the table view for empty cells.
        self.tableFooterView = UIView(frame: CGRectZero)
    }
}
