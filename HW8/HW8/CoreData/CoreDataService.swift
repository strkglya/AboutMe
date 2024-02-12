
import CoreData

final public class CoreDataService {
    
    static let shared = CoreDataService()
    
    private init() {}
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "HW8")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    static func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    static func saveStudent(studentModel: StudentModel) {
        let context = CoreDataService.context
        
        guard let teacher = findTeacher(with: studentModel.teacher) else {
            print("Teacher not found.")
            return
        }
        
        let student = Student(context: context)
        student.name = studentModel.name
        student.age = Int16(studentModel.age)
        student.teacher = teacher
        
        CoreDataService.saveContext()
    }
    
    static private func findTeacher(with teacherModel: TeacherModel) -> Teacher? {
        let context = CoreDataService.context
        let fetchRequest: NSFetchRequest<Teacher> = Teacher.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", teacherModel.name)
        
        do {
            let teachers = try context.fetch(fetchRequest)
            return teachers.first
        } catch {
            print("Error fetching teacher: \(error)")
            return nil
        }
    }
    
    
    static func saveTeacher(teacherModel: TeacherModel) {
        let context = CoreDataService.context
        let teacher = Teacher(context: context)
        teacher.name = teacherModel.name
        teacher.age = Int16(teacherModel.age)
        //
        //        for studentModel in teacherModel.students {
        //            let student = Student(context: context)
        //            student.name = studentModel.name
        //            student.age = Int16(studentModel.age)
        //            student.teacher = teacher
        //            teacher.addToStudent(student)
        //        }
        //
        CoreDataService.saveContext()
    }
    
    static func loadTeacher() -> [TeacherModel] {
        let context = CoreDataService.context
        let fetchRequest: NSFetchRequest<Teacher> = Teacher.fetchRequest()
        do {
            let teachers = try context.fetch(fetchRequest)
            return teachers.map { teacher in
                return teacherToModel(from: teacher)
            }
        } catch {
            print("Failed to fetch teachers: \(error)")
            return []
        }
    }
    
    static func loadStudent() -> [StudentModel] {
        let context = CoreDataService.context
        let fetchRequest: NSFetchRequest<Student> = Student.fetchRequest()
        do {
            let students = try context.fetch(fetchRequest)
            return students.map { student in
                return studentToModel(from: student)
            }
        } catch {
            print("Failed to fetch students: \(error)")
            return []
        }
    }
    
    static private func teacherEntity(from teacherModel: TeacherModel) -> Teacher {
        let context = CoreDataService.context
        let teacher = Teacher(context: context)
        teacher.name = teacherModel.name
        teacher.age = Int16(teacherModel.age)
        let students = teacherModel.students
        for model in teacherModel.students{
            let studentModel = studentEntity(from: model)
            teacher.addToStudent(studentModel)
        }
        return teacher
    }
    
    static func studentEntity(from studentModel: StudentModel) -> Student {
        let context = CoreDataService.context
        
        let teacher = findTeacher(with: studentModel.teacher)
        
        let student = Student(context: context)
        student.name = studentModel.name
        student.age = Int16(studentModel.age)
        student.teacher = teacher
        
        return student
    }
    
    static private func teacherToModel(from teacher: Teacher) -> TeacherModel {
        guard let studentsSet = teacher.student as? Set<Student> else {
            return TeacherModel(name: teacher.name ?? "", age: Int(teacher.age), students: [])
        }
        
        let students = studentsSet.map { student in
            return StudentModel(name: student.name ?? "", age: Int(student.age), teacher: TeacherModel(name: teacher.name ?? "", age: Int(teacher.age), students: []))
        }
        
        return TeacherModel(name: teacher.name ?? "", age: Int(teacher.age), students: students)
    }
    
    static private func studentToModel(from student: Student) -> StudentModel {
        return StudentModel(name: student.name ?? "", age: Int(student.age), teacher: teacherToModel(from: student.teacher!))
    }
}
