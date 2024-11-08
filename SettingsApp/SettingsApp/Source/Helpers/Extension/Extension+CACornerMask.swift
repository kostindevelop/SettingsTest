//
//  Extension+CACornerMask.swift
//  SettingsApp
//
//  Created by Konstantin Antonyuk on 08.11.2024.
//

import UIKit

extension CACornerMask {
    
    static var topCorners: CACornerMask {
        [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    static var leftCorners: CACornerMask {
        [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    static var rightCorners: CACornerMask {
        [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    static var bottomCorners: CACornerMask {
        [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    static var allCorners: CACornerMask {
        [.topCorners, .bottomCorners]
    }
    
    static var none: CACornerMask { [] }
}
