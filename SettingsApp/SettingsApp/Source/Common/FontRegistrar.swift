//
//  Untitled.swift
//  SettingsApp
//
//  Created by Konstantin Antonyuk on 08.11.2024.
//

import UIKit
import CoreText

struct CustomFont {
    let filename: String
    let fileExtension: String
}

class FontRegistrar {
    
    static func registerFonts(_ fonts: [CustomFont]) {
        for font in fonts {
            registerFont(withFilenameString: font.filename, fileExtension: font.fileExtension)
        }
    }

    private static func registerFont(withFilenameString filenameString: String, fileExtension: String) {
        guard let fontURL = Bundle.main.url(forResource: filenameString, withExtension: fileExtension) else {
            print("Font REG: File not found \(filenameString).\(fileExtension)")
            return
        }
        
        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            print("Font REG: Failed to create CGDataProvider for font \(filenameString).\(fileExtension)")
            return
        }
        
        guard let font = CGFont(fontDataProvider) else {
            print("Font REG: Failed to create CGFont for font \(filenameString).\(fileExtension)")
            return
        }
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            if let error = error {
                let errorDescription = CFErrorCopyDescription(error.takeUnretainedValue())
                print("Font REG: Font registration error: \(String(describing: errorDescription))")
            } else {
                print("Font REG: An unknown error occurred while registering the font.")
            }
        } else {
            print("Font REG: Font \(filenameString) registered successfully.")
        }
    }
}
