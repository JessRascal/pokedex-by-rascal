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
        
    }
    
    func setBackground(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .ScaleAspectFit
        backgroundView = imageView
    }

}
