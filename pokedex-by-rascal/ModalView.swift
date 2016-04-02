//
//  ModalView.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 01/04/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class ModalView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.masksToBounds = true
        layer.cornerRadius = 5.0
    }

}
