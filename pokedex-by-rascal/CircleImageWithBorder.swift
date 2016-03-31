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
        
        backgroundColor = UIColor.appSecondaryColorTrans()
        
        layer.masksToBounds = true
        layer.cornerRadius = self.frame.width / 2
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.appAccentColor().CGColor
    }
}
