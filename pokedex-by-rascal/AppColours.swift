//
//  AppColours.swift
//  pokedex-by-rascal
//
//  Created by Michael Jessey on 25/03/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

extension UIColor {
    
    // Primary App Colour - Red (#f00000).
    class func appPrimaryColor() -> UIColor {
        return UIColor(red: 240/255, green: 0/255, blue: 0/255, alpha: 1)
    }
    
    // Semi-transparent Primary App Colour - Red (#f00000) with an alpha value of 0.5.
    class func appPrimaryColorTrans() -> UIColor {
        return UIColor(red: 240/255, green: 0/255, blue: 0/255, alpha: 0.5)
    }
    
    // Secondary App Colour - Very Light Grey/White (#f0f0f0).
    class func appSecondaryColor() -> UIColor {
        return UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    }
    
    // Semi-transparent Secondary App Colour - Very Light Grey/White (#f0f0f0) with an aplha value of 0.5.
    class func appSecondaryColorTrans() -> UIColor {
        return UIColor.appSecondaryColor().colorWithAlphaComponent(0.5)
    }
    
    // Accent App Colour - Dark Grey/Black (#222224).
    class func appAccentColor() -> UIColor {
        return UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
    }
    
    // Semi-transparent Accent App Colour - Dark Grey/Black (#222224) with an alpha value of 0.5.
    class func appAccentColorTrans() -> UIColor {
        return UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.5)
    }
}
