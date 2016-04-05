//
//  ModalCancelButton.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 02/04/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class ModalCancelButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setImage(UIImage(named: "cancel-button-empty"), forState: .Normal)
        setImage(UIImage(named: "cancel-button-filled"), forState: .Highlighted)
    }
}
