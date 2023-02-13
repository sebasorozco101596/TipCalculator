//
//  UIResponder+Extension.swift
//  TipCalculator
//
//  Created by Juan Sebastian Orozco Buitrago on 2/12/23.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
