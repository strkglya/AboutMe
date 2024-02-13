//
//  BasicCell.swift
//  HW8
//
//  Created by Александра Среднева on 3.02.24.
//

import UIKit

final class BasicCell: UITableViewCell {
    
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    
    func configure(object: Displayable){
        nameLabel.text = object.name
        ageLabel.text = String(object.age)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setUpCell(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        contentView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.font = .systemFont(ofSize: 24, weight: .regular)
        contentView.addSubview(ageLabel)
        
        ageLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.right).offset(20)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
}
