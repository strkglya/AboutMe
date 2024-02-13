//
//  StudentDetails.swift
//  HW8
//
//  Created by Александра Среднева on 7.02.24.
//

import UIKit
import SnapKit

final class StudentDetails: UIViewController {

    private var nameLabel = UILabel()
    private var ageLabel = UILabel()
    private var teacherLabel = UILabel()
    
    var selectedStudent: StudentModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI(){
        view.backgroundColor = .white
        setUpLabels()
        setUpConstraints()
    }
    
    private func setUpLabels(){
        guard let studentTeacher = selectedStudent?.teacher else {return}
        let teacherName = studentTeacher.name 

        Creator.setUpLabel(label: nameLabel, basicText: "Name: ", boldText: selectedStudent?.name ?? "nil")
        Creator.setUpLabel(label: ageLabel, basicText: "Age: ", boldText: String(selectedStudent?.age ?? 0))
        Creator.setUpLabel(label: teacherLabel, basicText: "Teacher: ", boldText: teacherName)
        
        view.addSubview(nameLabel)
        view.addSubview(ageLabel)
        view.addSubview(teacherLabel)
    }
    
    private func setUpConstraints(){
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide.snp.top)
            make.left.equalTo(20)
        }
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.left.equalTo(20)
        }
        teacherLabel.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom).offset(20)
            make.left.equalTo(20)
        }
    }
}
