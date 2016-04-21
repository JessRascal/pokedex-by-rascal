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
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.appAccentColor().CGColor
    }
    
    override func layoutSubviews() {
        // Defined corner radius here so that it's set after the dynamic size of the image has been set.
        layer.cornerRadius = self.frame.width / 2
    }
}
