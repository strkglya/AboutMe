//
//  ViewController.swift
//  HW8
//
//  Created by Александра Среднева on 2.02.24.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    private var students = [Student]()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadInfo()
        tableView.reloadData()
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
    
    private func loadInfo(){
        let request = Student.fetchRequest()
        if let loadedStudents = try? CoreDataService.context.fetch(request) {
            students = try! CoreDataService.context.fetch(request)
        }
    }
    
    @objc func newStudent(){
        let newPersonVC = NewStudentController()
        navigationController?.pushViewController(newPersonVC, animated: true)
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

