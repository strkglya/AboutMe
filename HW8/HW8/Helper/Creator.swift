//
//  File.swift
//  HW8
//
//  Created by Александра Среднева on 2.02.24.
//

import UIKit

class Creator {
    
    static func setUpButton(button: UIButton, target: Any, title: String, action: Selector, bgColor: UIColor = .purple, textColor: UIColor = .white, borderColor: UIColor = .white, borderWidth: CGFloat = 0, cornerRadius: CGFloat = 0){
        button.setTitle(title, for: .normal)
        button.backgroundColor = bgColor
        button.setTitleColor(textColor, for: .normal)
      
        button.layer.borderColor = borderColor.cgColor
        button.layer.borderWidth = borderWidth
        button.layer.cornerRadius = cornerRadius
        button.addTarget(target, action: action, for: .touchUpInside)
    }
}
