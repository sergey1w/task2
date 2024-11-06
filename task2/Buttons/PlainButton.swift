//
//  PlainButton.swift
//  task2
//
//  Created by sergey on 06.11.2024.
//

import UIKit

final class PlainButton: UIButton {
    
    let title: String
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        setup()
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        
        let colorState = ColorState(mode: tintAdjustmentMode)
        
        tintColor = colorState.foregroundColor
        backgroundColor = colorState.backgroundColor
        setTitleColor(colorState.foregroundColor, for: .normal)
        
    }
    
    override var isHighlighted: Bool {
        didSet {
            let transform = isHighlighted ? CGAffineTransform(scaleX: 0.9, y: 0.9) : .identity
            UIView.animate(withDuration: 0.25, delay: 0, options: .allowUserInteraction) {
                self.transform = transform
            }
        }
    }
    
    private func setup() {
        let configuration = UIImage.SymbolConfiguration(textStyle: .title3)
        
        let image = UIImage(systemName: "arrow.right.circle.fill", withConfiguration: configuration)
        
        setTitle(title, for: .normal)
        setImage(image, for: .normal)
        setImage(image, for: .highlighted)
        
        semanticContentAttribute = .forceRightToLeft

        backgroundColor = ColorState.normal.backgroundColor
        tintColor = ColorState.normal.foregroundColor

        layer.cornerRadius = 8

        contentEdgeInsets = .init(top: 10, left: 14, bottom: 10, right: 14)
        imageEdgeInsets = .init(top: 0, left: 4, bottom: 0, right: -4)
        titleEdgeInsets = .init(top: 0, left: -4, bottom: 0, right: 4)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
