//
//  Protocols.swift
//  HW8
//
//  Created by Александра Среднева on 3.02.24.
//

import Foundation

protocol Displayable {
    var name: String { get set }
    var age: Int {get set}
}

protocol NewStudent: AnyObject {
    func addStudent(student: Student)
}

protocol NewTeacher: AnyObject {
    func addTeacher(teacher: Teacher)
}
