//
//  TeacherTableVC.swift
//  HW8
//
//  Created by Александра Среднева on 3.02.24.
//

import UIKit
import SnapKit

final class TeacherTableVC: UIViewController {
    
    private var teachers = [Teacher(name: "Ivan", age: 44)] {
        didSet {
            print(teachers)
        }
    }
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI(){
        setUpNavBar()
        setUpTableView()
    }
    
    private func setUpNavBar(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newTeacher))
        navigationItem.rightBarButtonItem = addButton
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(BasicCell.self, forCellReuseIdentifier: Constant.teacherCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
    }
    
    @objc func newTeacher(){
        let newPersonVC = NewTeacherController()
        newPersonVC.delegate = self
        navigationController?.pushViewController(newPersonVC, animated: true)
    }
}

extension TeacherTableVC: NewTeacher {
    func addTeacher(teacher: Teacher) {
        teachers.append(teacher)
        tableView.reloadData()
    }
}

extension TeacherTableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teachers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.teacherCellIdentifier, for: indexPath) as? BasicCell
        cell?.separatorInset = UIEdgeInsets.zero
        cell?.preservesSuperviewLayoutMargins = false
        cell?.configure(object: teachers[indexPath.row])
        return cell ?? UITableViewCell()
    }
}



