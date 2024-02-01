import UIKit
import SnapKit

protocol AddPerson: AnyObject {
    func newPerson(person: Person)
}

struct Person {
    var name: String
    var surname: String
}

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let newPersonVC = NewPersonController()

    private var personArray = [Person]()
    private var firstLettersArray = [String]()
    private var dictionary = [String : [Person]]()
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setUpUI()
        firstLetters()
    }
    
    private func setUpUI() {
        setUpTableView()
        setUpNavBar()
    }
    
    private func setUpTableView() {
        tableView.register(PersonCell.self, forCellReuseIdentifier: "PersonCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(0)
        }
    }
    
    private func setUpNavBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPerson))
        navigationItem.rightBarButtonItem = addButton
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editPersons))
        navigationItem.leftBarButtonItem = editButton
    }

    private func firstLetters(){
        dictionary = Dictionary(grouping: personArray, by: { person in
            return String(person.name.prefix(1))
        })
        for (key, value) in dictionary {
            dictionary[key] = value.sorted(by: { $0.surname < $1.surname})
        }
        firstLettersArray = dictionary.keys.sorted()
    }
    
    private func updateSectionsData() {
        dictionary.removeAll()
        firstLettersArray.removeAll()
        firstLetters()
        tableView.reloadData()
    }
    
    @objc private func addPerson() {
        newPersonVC.delegate = self
        present(newPersonVC, animated: true)
    }
    
    @objc private func editPersons(){
        tableView.setEditing(!tableView.isEditing, animated: true)
        if tableView.isEditing {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editPersons))
        } else {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editPersons))
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        firstLettersArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return firstLettersArray[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let personKeys = firstLettersArray[section]
        return dictionary[personKeys]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonCell
        let sectionFirstLetter = firstLettersArray[indexPath.section]
        if let personInSection = dictionary[sectionFirstLetter]{
            let person = personInSection[indexPath.row]
            cell?.configure(person: person)
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return tableView.isEditing
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //буква по номеру секции
            let letter = firstLettersArray[indexPath.section]
            // если по этому номеру существуют значения в словаре
            if var personsInSection = dictionary[letter] {
                //удаляем значение в словаре
                personsInSection.remove(at: indexPath.row)
                //обновляем словарь новыми данными
                dictionary[letter] = personsInSection
                //заполняем массив новыми данными
                personArray = dictionary.values.flatMap { $0 }
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            if let remainingRows = dictionary[letter], remainingRows.isEmpty {
                dictionary.removeValue(forKey: letter)
                firstLettersArray = dictionary.keys.sorted()
                tableView.deleteSections(IndexSet(integer: indexPath.section), with: .fade)
            }
        }
    }
}

extension ViewController: AddPerson{
    func newPerson(person: Person) {
        personArray.append(person)
        updateSectionsData()
    }
}
