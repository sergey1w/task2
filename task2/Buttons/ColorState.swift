//
//  ColorState.swift
//  task2
//
//  Created by sergey on 06.11.2024.
//

import UIKit

enum ColorState {
    case normal
    case dimmed
    
    init(mode: UIButton.TintAdjustmentMode) {
        self = mode == .dimmed ? .dimmed : .normal
    }
    
    var backgroundColor: UIColor {
        return self == .dimmed ? .systemGray2 : .systemBlue
    }
    
    var foregroundColor: UIColor {
        return self == .dimmed ? .systemGray3 : .white
    }
}
