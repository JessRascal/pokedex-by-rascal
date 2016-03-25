//
//  AppColours.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 25/03/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

extension UIColor {
    
    // Primary App Colour - Red (#f00000)
    class func appPrimaryColor() -> UIColor {
        return UIColor(red: 240/255, green: 0/255, blue: 0/255, alpha: 1)
    }
    
    // Secondary App Colour - Very Light Grey/White (#f0f0f0)
    class func appSecondaryColor() -> UIColor {
        return UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    }
    
    // Accent App Colour - Dark Grey/Black (#222224)
    class func appAccentColor() -> UIColor {
        return UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
    }
}
