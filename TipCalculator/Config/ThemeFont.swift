//
//  ThemeFont.swift
//  TipCalculator
//
//  Created by Juan Sebastian Orozco Buitrago on 2/11/23.
//

import UIKit

/// Class for to set the font to the app with AvenirNext Family
struct ThemeFont {
    static func regular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Regular",size: size) ?? .systemFont(ofSize: size)
    }
    
    static func bold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Bold",size: size) ?? .systemFont(ofSize: size)
    }
    
    static func demiBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-DemiBold",size: size) ?? .systemFont(ofSize: size)
    }
}
