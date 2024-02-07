//
//  NewPersonController.swift
//  HW8
//
//  Created by Александра Среднева on 2.02.24.
//

import UIKit
import SnapKit

class NewStudentController: UIViewController, TeacherSelectionDelegate {
    
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    
    private let nameTextField = UITextField()
    private let ageTextField = UITextField()
    
    private var chooseTeacherButton = UIButton()
    private let saveButton = UIButton()
    
    private let nameStack = UIStackView()
    private let ageStack = UIStackView()
    private let buttonsStack = UIStackView()
    
    var chosenTeacher: Teacher?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        saveButton.isEnabled = false
    }
    
    func didSelectTeacher(_ teacher: Teacher) {
        chosenTeacher = teacher
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
        Creator.setUpTextFields(textfield: nameTextField, placeholder: "Enter name")
        nameTextField.delegate = self
        
        Creator.setUpTextFields(textfield: ageTextField, placeholder: "Enter age", keyboardType: .numberPad)
        ageTextField.delegate = self
        
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
        Creator.setUpButton(button: saveButton, target: self, title: "Save", action: #selector(self.saveAction))
        view.addSubview(saveButton)
    }
    
    private func setUpStacks(){
        setUpLabels()
        setUpTextFields()
        setUpButtons()
        
        Creator.setUpStack(stack: nameStack, subviews: [nameLabel,nameTextField])
        Creator.setUpStack(stack: ageStack, subviews: [ageLabel, ageTextField])
        Creator.setUpStack(stack: buttonsStack, subviews: [chooseTeacherButton,saveButton])
        
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
        let teacherTableVC = TeacherTableVC()
        teacherTableVC.isFromInitialScreen = false
        teacherTableVC.delegate = self
        navigationController?.pushViewController(teacherTableVC, animated: true)
    }
    
    @objc private func saveAction(){
        if let nameText = nameTextField.text, !nameText.isEmpty,
           let lastnameText = ageTextField.text, !lastnameText.isEmpty, chosenTeacher != nil {
            let context = CoreDataService.context
            context.perform {
                let newStudent = Student(context: context)
                newStudent.name = nameText
                newStudent.age = Int16(lastnameText)!
                newStudent.teacher = self.chosenTeacher
                CoreDataService.saveContext()
            }
            saveButton.setTitle("Choosen teacher:  \(String(describing: chosenTeacher?.name))", for: .normal)
        }
        
        nameTextField.text = ""
        ageTextField.text = ""
        navigationController?.popViewController(animated: true)
    }
}

extension NewStudentController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let nameText = nameTextField.text, let lastnameText = ageTextField.text {
            saveButton.isEnabled = !nameText.isEmpty && !lastnameText.isEmpty && chosenTeacher != nil
        }
    }
}
