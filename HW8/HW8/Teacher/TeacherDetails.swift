//
//  TeacherDetails.swift
//  HW8
//
//  Created by Александра Среднева on 7.02.24.
//

import UIKit

final class TeacherDetails: UIViewController {
    
    private var nameLabel = UILabel()
    private var ageLabel = UILabel()
    private var studentsTable = UITableView()
    
    var selectedTeacher: TeacherModel?
    private var loadedStudents = [StudentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        doLoad()
    }
    
    private func doLoad(){
        loadStudents()
    }
    
    private func loadStudents(){
        guard let teacherStudents = selectedTeacher?.students else {return}
        loadedStudents = teacherStudents
    }
    
    private func setUpUI(){
        view.backgroundColor = .white
        setUpLabels()
        setUpStudentsTable()
        setUpConstraints()
    }
    
    private func setUpLabels(){
        Creator.setUpLabel(label: nameLabel, basicText: "Name: ", boldText: selectedTeacher?.name ?? "nil")
        Creator.setUpLabel(label: ageLabel, basicText: "Age: ", boldText: String(selectedTeacher?.age ?? 0))
        
        view.addSubview(nameLabel)
        view.addSubview(ageLabel)
    }
    
    private func setUpStudentsTable(){
        studentsTable.delegate = self
        studentsTable.dataSource = self
        
        studentsTable.register(BasicCell.self, forCellReuseIdentifier: Constant.studentCellIdentifier)
        view.addSubview(studentsTable)
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
        studentsTable.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom).offset(20)
            make.left.right.equalTo(0)
            make.bottom.equalTo(100)
        }
    }
}

extension TeacherDetails: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let studentDetails = StudentDetails()
        studentDetails.selectedStudent = loadedStudents[indexPath.row]
        navigationController?.pushViewController(studentDetails, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadedStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = studentsTable.dequeueReusableCell(withIdentifier: Constant.studentCellIdentifier, for: indexPath) as? BasicCell
        cell?.separatorInset = UIEdgeInsets.zero
        cell?.preservesSuperviewLayoutMargins = false
        cell?.configure(object: loadedStudents[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
}
