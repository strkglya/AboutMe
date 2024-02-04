//
//  Student+CoreDataProperties.swift
//  
//
//  Created by Александра Среднева on 3.02.24.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var age: Int16
    @NSManaged public var name: String?
    @NSManaged public var teacher: Teacher?

}
