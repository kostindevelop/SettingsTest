//
//  Extension+UIColor.swift
//  SettingsApp
//
//  Created by Konstantin Antonyuk on 08.11.2024.
//

import UIKit

public extension UIColor {
    
    convenience init(_ colorStyle: ColorStyle) {
        self.init(named: colorStyle.rawValue, in: Bundle.main, compatibleWith: nil)!
    }
}
