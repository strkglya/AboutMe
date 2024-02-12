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

protocol TeacherSelectionDelegate: AnyObject {
    func didSelectTeacher(_ teacher: TeacherModel)
}

