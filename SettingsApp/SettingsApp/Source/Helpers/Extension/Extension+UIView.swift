//
//  Extension+UIView.swift
//  SettingsApp
//
//  Created by Konstantin Antonyuk on 08.11.2024.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func withCornerRadius(
        _ radius: CGFloat = 16.0,
        clipsToBounds: Bool = true,
        corners: CACornerMask = [.layerMaxXMaxYCorner,
                                 .layerMaxXMinYCorner,
                                 .layerMinXMaxYCorner,
                                 .layerMinXMinYCorner]
    ) -> Self {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
        layer.masksToBounds = false
        self.clipsToBounds = clipsToBounds
        
        return self
    }
}
