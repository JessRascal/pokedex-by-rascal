//
//  CircleImageWithBorder.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 25/03/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class CircleImageWithBorder: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.appAccentColor().CGColor
    }
}
