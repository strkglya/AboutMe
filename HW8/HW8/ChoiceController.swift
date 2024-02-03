//
//  ChoiceController.swift
//  HW8
//
//  Created by Александра Среднева on 2.02.24.
//

import UIKit

class ChoiceController: UIViewController {
    
    private let studentButton = UIButton()
    private let teacherButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        Creator.setUpButton(button: studentButton, target: self, title: "Student", action: #selector(goToStudent))
        Creator.setUpButton(button: teacherButton, target: self, title: "Teacher", action: #selector(goToteacher))

        view.addSubview(studentButton)
        view.addSubview(teacherButton)
        studentButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(40)
        }

        teacherButton.snp.makeConstraints { make in
            make.top.equalTo(studentButton.snp.bottom).offset(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(40)
        }
    }
    
    @objc private func goToStudent(){
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    @objc private func goToteacher(){
        navigationController?.pushViewController(TeacherTableVC(), animated: true)
    }
}
