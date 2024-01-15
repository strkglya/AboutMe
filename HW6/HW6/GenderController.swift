//
//  GenderController.swift
//  HW6
//
//  Created by Александра Среднева on 9.01.24.
//

import UIKit

class GenderController: UIViewController {
    
    weak var delegate : SentData?
    
    private let nicknameVC = NicknameController()
    
    private let instructions = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let maleButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let femaleButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let genderStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI(){
        setUpInstructions()
        setUpStack()
        setUpConstraints()
    }
    
    private func setUpInstructions(){
        instructions.text = "Choose gender"
        instructions.textColor = .black
        instructions.font = .systemFont(ofSize: 18)
        instructions.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(instructions)
    }
    
    private func setUpMaleButton(){
        configButton(button: maleButton, title: "Male")
        maleButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        
        view.addSubview(maleButton)
    }
    
    private func setUpFemaleButton(){
        configButton(button: femaleButton, title: "Female")
        femaleButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
       
        view.addSubview(femaleButton)
    }
    
    private func setUpStack(){
        setUpMaleButton()
        setUpFemaleButton()
        genderStack.addArrangedSubview(maleButton)
        genderStack.addArrangedSubview(femaleButton)
        genderStack.spacing = 10
        genderStack.axis = .vertical
        
        view.addSubview(genderStack)
    }
    
    func configButton(button: UIButton, title: String){
        button.setTitle(title, for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.purple.cgColor
        button.layer.cornerRadius = 10
       
        view.addSubview(button)
    }
    
    private func setUpConstraints(){
        instructions.snp.makeConstraints { make in
            make.left.equalTo(genderStack.snp.left)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
        }
        
        genderStack.snp.makeConstraints { make in
            make.top.equalTo(instructions.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view).multipliedBy(0.9)
        }
    }
    
    @objc private func goToNextScreen(){
        guard let navVC = navigationController else {return}
        nicknameVC.delegate = delegate
        //delegate?.didEnterGender(gender: "Myzhlo")
        navVC.pushViewController(nicknameVC, animated: true)
    }
}
