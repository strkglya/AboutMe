//
//  MenuViewController.swift
//  HW6
//
//  Created by Александра Среднева on 12.01.24.
//

import UIKit

class MenuViewController: UIViewController {
    private let userImage = UIImageView()
    private let placeholder = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI() {
        setUpImage()
        setUpPlaceholder()
    }
    
    private func setUpImage(){
        userImage.clipsToBounds = true
        userImage.layer.borderWidth = 2
        userImage.layer.borderColor = UIColor.purple.cgColor
        userImage.backgroundColor = #colorLiteral(red: 0.9406403899, green: 0.9406403899, blue: 0.9406403899, alpha: 1)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(userImage)
    }
    
    private func setUpPlaceholder(){
        placeholder.text = "No Image"
        placeholder.textColor = .black
        placeholder.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(placeholder)
    }
    
    private func setupConstraints() {
        userImage.snp.makeConstraints { make in
            make.height.equalTo(view.snp.height).multipliedBy(0.3)
            make.width.equalTo(userImage.snp.height)
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.safeAreaLayoutGuide.snp.centerY).multipliedBy(0.7)
        }
        
        placeholder.snp.makeConstraints { make in
            make.center.equalTo(userImage)
        }
    }
}
