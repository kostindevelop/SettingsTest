//
//  Extension+UIFont.swift
//  SettingsApp
//
//  Created by Konstantin Antonyuk on 08.11.2024.
//

import UIKit

extension UIFont {
    
    static func customFont(named name: String, size: CGFloat) -> UIFont? {
        guard let font = UIFont(name: name, size: size) else {
            print("Font REG: Failed to load font named \(name)")
            return nil
        }
        return font
    }
    
    static func fManropeBold(size: CGFloat) -> UIFont? {
        return UIFont.customFont(named: "Manrope-Bold", size: size)
    }
    
    static func fManropeMedium(size: CGFloat) -> UIFont? {
        return UIFont.customFont(named: "Manrope-Medium", size: size)
    }
}

