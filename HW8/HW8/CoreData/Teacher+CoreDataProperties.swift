//
//  Teacher+CoreDataProperties.swift
//  
//
//  Created by Александра Среднева on 3.02.24.
//
//

import Foundation
import CoreData


extension Teacher {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Teacher> {
        return NSFetchRequest<Teacher>(entityName: "Teacher")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var student: Student?

}
