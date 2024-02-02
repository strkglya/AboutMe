//
//  NewPersonController.swift
//  HW7
//
//  Created by Александра Среднева on 11.01.24.
//

import UIKit
import SnapKit

final class NewPersonController: UIViewController {
    
    weak var delegate: AddPerson?
    
    private let nameLabel = UILabel()
    private let lastnameLabel = UILabel()

    private let nameTextField = UITextField()
    private let lastnameTextField = UITextField()
    
    private let cancelButton = UIButton()
    private let saveButton = UIButton()
    
    private let nameStack = UIStackView()
    private let lastnameStack = UIStackView()
    private let buttonsStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
        nameTextField.delegate = self
        lastnameTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        saveButton.isEnabled = false
    }
    
    private func setUpUI(){
        setUpStacks()
        setUpConstraints()
    }
    
    private func setUpLabels(){
        nameLabel.text = "Name"
        nameLabel.font = .systemFont(ofSize: 24)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        lastnameLabel.text = "Lastname"
        lastnameLabel.font = .systemFont(ofSize: 24)
        lastnameLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(nameLabel)
        view.addSubview(lastnameLabel)
    }
    
    private func setUpTextFields(){
        nameTextField.placeholder = "Enter name"
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.borderStyle = .roundedRect

        lastnameTextField.placeholder = "Enter lastname"
        lastnameTextField.translatesAutoresizingMaskIntoConstraints = false
        lastnameTextField.borderStyle = .roundedRect
        
        view.addSubview(nameTextField)
        view.addSubview(lastnameTextField)
    }
    
    private func setUpButtons(){
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.blue, for: .normal)
        cancelButton.layer.borderColor = UIColor.blue.cgColor
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.cornerRadius = 15
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)

        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .blue
        saveButton.layer.cornerRadius = 15
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        
        view.addSubview(cancelButton)
        view.addSubview(saveButton)
    }
    
    private func setUpStacks(){
        setUpLabels()
        setUpTextFields()
        setUpButtons()
        
        nameStack.axis = .vertical
        nameStack.addArrangedSubview(nameLabel)
        nameStack.addArrangedSubview(nameTextField)
        nameStack.distribution = .fillEqually
        
        lastnameStack.axis = .vertical
        lastnameStack.addArrangedSubview(lastnameLabel)
        lastnameStack.addArrangedSubview(lastnameTextField)
        lastnameStack.distribution = .fillEqually

        buttonsStack.axis = .horizontal
        buttonsStack.addArrangedSubview(cancelButton)
        buttonsStack.addArrangedSubview(saveButton)
        buttonsStack.spacing = 20
        buttonsStack.distribution = .fillEqually
        
        view.addSubview(nameStack)
        view.addSubview(lastnameStack)
        view.addSubview(buttonsStack)
    
    }
    
    private func setUpConstraints(){
       
        nameStack.snp.makeConstraints { make in
            make.top.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        lastnameStack.snp.makeConstraints { make in
            make.top.equalTo(nameStack.snp.bottom).offset(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        buttonsStack.snp.makeConstraints { make in
            make.bottom.equalTo(-60)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }

        cancelButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(buttonsStack.snp.width).multipliedBy(0.5).offset(-10)
        }

        saveButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(cancelButton.snp.width)
        }
    }
    
    @objc private func cancelAction(){
        nameTextField.text = ""
        lastnameTextField.text = ""
        dismiss(animated: true)
    }
    
    @objc private func saveAction(){
        if let nameText = nameTextField.text, !nameText.isEmpty,
           let lastnameText = lastnameTextField.text, !lastnameText.isEmpty {
            delegate?.newPerson(person: Person(name: nameText, surname: lastnameText))
        }
        
        nameTextField.text = ""
        lastnameTextField.text = ""
        dismiss(animated: true)
    }
}

extension NewPersonController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let nameText = nameTextField.text, let lastnameText = lastnameTextField.text {
            saveButton.isEnabled = !nameText.isEmpty && !lastnameText.isEmpty
        }
    }
}

