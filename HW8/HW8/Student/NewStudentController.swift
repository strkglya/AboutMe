//
//  NewPersonController.swift
//  HW8
//
//  Created by Александра Среднева on 2.02.24.
//

import UIKit
import SnapKit

class NewStudentController: UIViewController {
    
    weak var delegate: NewStudent?
    
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()

    private let nameTextField = UITextField()
    private let ageTextField = UITextField()
    
    private var chooseTeacherButton = UIButton()
    private let saveButton = UIButton()
    
    private let nameStack = UIStackView()
    private let ageStack = UIStackView()
    private let buttonsStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
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
        
        ageLabel.text = "Age"
        ageLabel.font = .systemFont(ofSize: 24)
        ageLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(nameLabel)
        view.addSubview(ageLabel)
    }
    
    private func setUpTextFields(){
        nameTextField.delegate = self
        nameTextField.placeholder = "Enter name"
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.borderStyle = .roundedRect
        
        ageTextField.delegate = self
        ageTextField.placeholder = "Enter age"
        ageTextField.keyboardType = .numberPad
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.borderStyle = .roundedRect
        
        view.addSubview(nameTextField)
        view.addSubview(ageTextField)
    }
    
    private func setUpButtons(){
        Creator.setUpButton(button: chooseTeacherButton,
                            target: self,
                            title: "Choose teacher",
                            action: #selector(self.chooseTeacher),
                            bgColor: .white,
                            textColor: .purple,
                            borderColor: .purple,
                            borderWidth: 2)
        view.addSubview(chooseTeacherButton)
        Creator.setUpButton(button: saveButton, target: self, title: "Save", action: #selector(saveAction))
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
        
        ageStack.axis = .vertical
        ageStack.addArrangedSubview(ageLabel)
        ageStack.addArrangedSubview(ageTextField)
        ageStack.distribution = .fillEqually

        buttonsStack.axis = .vertical
        buttonsStack.addArrangedSubview(chooseTeacherButton)
        buttonsStack.addArrangedSubview(saveButton)
        buttonsStack.spacing = 20
        buttonsStack.distribution = .fillEqually
        
        view.addSubview(nameStack)
        view.addSubview(ageStack)
        view.addSubview(buttonsStack)
    
    }
    
    private func setUpConstraints(){
        nameStack.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide.snp.top)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        ageStack.snp.makeConstraints { make in
            make.top.equalTo(nameStack.snp.bottom).offset(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        buttonsStack.snp.makeConstraints { make in
            make.top.equalTo(ageStack.snp.bottom).offset(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }

        chooseTeacherButton.snp.makeConstraints { make in
            make.height.equalTo(40)
        }

        saveButton.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
    }
    
    @objc private func chooseTeacher(){
        let teacherVC = TeacherTableVC()
        navigationController?.pushViewController(teacherVC, animated: true)
    }
    
    @objc private func saveAction(){
        if let nameText = nameTextField.text, !nameText.isEmpty,
           let lastnameText = ageTextField.text, !lastnameText.isEmpty {
            delegate?.addStudent(student: Student(name: nameText, age: Int(lastnameText)!))
        }
        
        nameTextField.text = ""
        ageTextField.text = ""
        navigationController?.popViewController(animated: true)
    }
}

extension NewStudentController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let nameText = nameTextField.text, let lastnameText = ageTextField.text {
            saveButton.isEnabled = !nameText.isEmpty && !lastnameText.isEmpty
        }
    }
}
