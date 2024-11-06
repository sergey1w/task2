//
//  ViewController.swift
//  task2
//
//  Created by sergey on 06.11.2024.
//

import UIKit

class ViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    private let firstButton = PlainButton(title: "First Button") //ConfigurationButton(title: "First button")
    private let econdMediumButton = ConfigurationButton(title: "Second medium button")
    private let thirdButton = ConfigurationButton(title: "Third")
    
    private var buttons: [UIButton] {
        [firstButton, econdMediumButton, thirdButton]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let spacing: CGFloat = 8
        
        for index in 0..<buttons.count {
            let button = buttons[index]
            
            button.bounds.size = button.intrinsicContentSize
            
            button.center.y = view.safeAreaInsets.top
            + button.bounds.midY * CGFloat(index + 1)
            + button.bounds.midY * CGFloat(index)
            + spacing * CGFloat(index)
            
            button.center.x = view.center.x
        }
        
    }
    
    @objc private func open(sender: UIButton) {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        vc.sheetPresentationController?.detents = [.medium()]
        present(vc, animated: true)
    }
    
    private func setup() {
        for button in buttons {
            view.addSubview(button)
        }
        
        thirdButton.addTarget(self, action: #selector(open(sender:)), for: .touchUpInside)
    }
}
