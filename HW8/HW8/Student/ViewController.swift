//
//  ViewController.swift
//  HW8
//
//  Created by Александра Среднева on 2.02.24.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    private var students = [Student(name: "hui", age: 12), Student(name: "biba", age: 14)]
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
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newStudent))
        navigationItem.rightBarButtonItem = addButton
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(BasicCell.self, forCellReuseIdentifier: Constant.studentCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
    }
    
    @objc func newStudent(){
        let newPersonVC = NewStudentController()
        newPersonVC.delegate = self
        navigationController?.pushViewController(newPersonVC, animated: true)
    }
}

extension ViewController: NewStudent {
    func addStudent(student: Student) {
        students.append(student)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.studentCellIdentifier, for: indexPath) as? BasicCell
        cell?.separatorInset = UIEdgeInsets.zero
        cell?.preservesSuperviewLayoutMargins = false
        cell?.configure(object: students[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

