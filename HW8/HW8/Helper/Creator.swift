//
//  File.swift
//  HW8
//
//  Created by Александра Среднева on 2.02.24.
//

import UIKit

class Creator {
    
    static func setUpButton(button: UIButton, 
                            target: Any,
                            title: String,
                            action: Selector,
                            bgColor: UIColor = .purple,
                            textColor: UIColor = .white,
                            borderColor: UIColor = .white,
                            borderWidth: CGFloat = 0,
                            cornerRadius: CGFloat = 0){
        button.setTitle(title, for: .normal)
        button.backgroundColor = bgColor
        button.setTitleColor(textColor, for: .normal)
      
        button.layer.borderColor = borderColor.cgColor
        button.layer.borderWidth = borderWidth
        button.layer.cornerRadius = cornerRadius
        button.addTarget(target, action: action, for: .touchUpInside)
    }
    
    static func setUpStack(stack: UIStackView,
                           axis: NSLayoutConstraint.Axis = .vertical,
                           spacing: CGFloat = 10,
                           distribution: UIStackView.Distribution = .fillEqually,
                           subviews: [UIView]){
        stack.axis = axis
        stack.spacing = spacing
        for subview in subviews {
            stack.addArrangedSubview(subview)
        }
        stack.distribution = distribution
    }
    
    static func setUpTextFields(textfield: UITextField, placeholder: String, keyboardType:  UIKeyboardType = .default){
        textfield.placeholder = placeholder
        textfield.keyboardType = keyboardType
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .roundedRect
    }
    
    static func setUpLabel(label: UILabel, text: String, size: CGFloat = 24, weight: UIFont.Weight = .regular){
        label.text = text
        label.font = .systemFont(ofSize: size, weight: weight)
    }
}
