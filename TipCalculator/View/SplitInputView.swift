//
//  SplitInputView.swift
//  TipCalculator
//
//  Created by Juan Sebastian Orozco Buitrago on 2/11/23.
//

import Foundation
import UIKit

class SplitInputView: UIView {
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        backgroundColor = .systemPink
    }
}

