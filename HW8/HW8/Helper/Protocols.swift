//
//  Protocols.swift
//  HW8
//
//  Created by Александра Среднева on 3.02.24.
//

import Foundation

protocol Displayable {
    var name: String? { get set }
    var age: Int16 {get set}
}

protocol TeacherSelectionDelegate: AnyObject {
    func didSelectTeacher(_ teacher: Teacher)
}

//protocol NewStudent: AnyObject {
//    func addStudent(student: Student)
//}
//
//protocol NewTeacher: AnyObject {
//    func addTeacher(teacher: Teacher)
//}
