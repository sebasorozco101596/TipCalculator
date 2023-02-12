//
//  LabelFactory.swift
//  TipCalculator
//
//  Created by Juan Sebastian Orozco Buitrago on 2/11/23.
//

import UIKit

/// Factory of labels.
struct LabelFactory {
    
    // Method that will create the new Label
    static func build(
        text: String?,
        font: UIFont,
        backgroundColor: UIColor = .clear,
        textColor: UIColor = ThemeColor.text,
        textAlignment: NSTextAlignment = .center) -> UILabel {
            
        let label = UILabel()
        label.text = text
        label.font = font
        label.backgroundColor = backgroundColor
        label.textColor = textColor
        label.textAlignment = textAlignment
        return label
    }
}
