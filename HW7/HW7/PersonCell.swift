//
//  PersonCell.swift
//  HW7
//
//  Created by Александра Среднева on 11.01.24.
//

import UIKit

final class PersonCell: UITableViewCell {

    private var name = UILabel()
    private var surname = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCell(){
        setUpName()
        setUpSurname()
        setUpConstraints()
    }
    
    private func setUpName(){
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = .systemFont(ofSize: 24)
        contentView.addSubview(name)
    }
    
    private func setUpSurname(){
        surname.font = .systemFont(ofSize: 16, weight: .thin)
        surname.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(surname)
    }
    
    private func setUpConstraints(){
        
        name.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        surname.snp.makeConstraints { make in
            make.left.equalTo(name.snp.right).offset(20)
            make.lastBaseline.equalTo(name.snp.lastBaseline)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(person: Person){
        name.text = person.name
        surname.text = person.surname
    }
}
