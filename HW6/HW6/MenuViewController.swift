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
    private let editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let saveButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let buttonsStack = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userImage.layer.cornerRadius = userImage.frame.height / 2
    }
    
    private func setupUI() {
        setUpImage()
        setUpPlaceholder()
        setUpButtonStack(stack: buttonsStack)
        setupConstraints()
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
    
    private func setUpButtonStack(stack: UIStackView) -> UIStackView {
        setUpSaveButton()
        setUpEditButton()
        setUpCancelButton()
        stack.axis = .vertical
        stack.addArrangedSubview(saveButton)
        stack.addArrangedSubview(editButton)
        stack.addArrangedSubview(cancelButton)
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    private func setUpSaveButton(){
        configButton(button: saveButton, title: "Save", bgColor: .purple)
    }
    
    private func setUpEditButton(){
        configButton(button: editButton, title: "Edit", borderWidth: 2, borderColor: UIColor.purple.cgColor)
    }
    
    private func setUpCancelButton(){
        configButton(button: cancelButton, title: "Cancel")
    }
    
    func configButton(button: UIButton, title: String, bgColor: UIColor = .white, borderWidth: CGFloat = 0, borderColor: CGColor = UIColor.white.cgColor){
        button.setTitle(title, for: .normal)
        button.backgroundColor = bgColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
        view.addSubview(button)
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
        buttonsStack.snp.makeConstraints { make in
//            make.bottom.equalTo(view).offset(100)
            make.left.equalTo(view.snp.left).offset(30)
            make.right.equalTo(view.snp.right).offset(-30)
        }
    }
}
