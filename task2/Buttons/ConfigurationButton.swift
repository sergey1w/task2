//
//  ConfigurationButton.swift
//  task2
//
//  Created by sergey on 06.11.2024.
//

import UIKit

final class ConfigurationButton: UIButton {

    convenience init(title: String) {
        self.init(configuration: .filled())
        setup(title: title)
    }
    
    private func setup(title: String) {
        var config = UIButton.Configuration.filled()
        config.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        config.image = .init(systemName: "arrow.right.circle.fill")
        config.imagePlacement = .trailing
        config.title = title
        config.imagePadding = 8
        
        configurationUpdateHandler = { button in
            UIView.animate(withDuration: 0.2, delay: 0, options: .allowUserInteraction) {
                switch button.state {
                case .highlighted:
                    button.transform = .init(scaleX: 0.9, y: 0.9)
                default:
                    button.transform = .identity
                }
            }
            
            var config = config
            
            let color = ColorState(mode: button.tintAdjustmentMode)
            
            config.background.backgroundColor = color.backgroundColor
            
            config.imageColorTransformer = .init({ _ in
                color.foregroundColor
            })
            
            config.titleTextAttributesTransformer = .init({ _ in
                AttributeContainer([.foregroundColor:color.foregroundColor])
            })
            
            button.configuration = config
        }
    }
}
