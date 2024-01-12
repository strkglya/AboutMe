//
//  NicknameController.swift
//  HW6
//
//  Created by Александра Среднева on 12.01.24.
//

import UIKit

class NicknameController: UIViewController {
    
    private let avatarVC = AvatarController()
    
    private let instructions = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let frog = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let hammer = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let king = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let gun = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

    private let nicknameStack = UIStackView()
    
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
        instructions.text = "Choose nickname"
        instructions.textColor = .black
        instructions.font = .systemFont(ofSize: 18)
        instructions.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(instructions)
    }
    
    private func setUpFrog(){
        configButton(button: frog, title: "Frog")
        frog.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
       
        view.addSubview(frog)
    }
    
    private func setUpHammer(){
        configButton(button: hammer, title: "Hammer")
        hammer.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
       
        view.addSubview(hammer)
    }
    
    private func setUpKing(){
        configButton(button: king, title: "King")
        king.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
       
        view.addSubview(king)
    }
    
    private func setUpGun(){
        configButton(button: gun, title: "Gun")
        gun.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
       
        view.addSubview(gun)
    }
    
    private func setUpStack(){
        setUpFrog()
        setUpHammer()
        setUpKing()
        setUpGun()

        nicknameStack.addArrangedSubview(frog)
        nicknameStack.addArrangedSubview(hammer)
        nicknameStack.addArrangedSubview(king)
        nicknameStack.addArrangedSubview(gun)
        nicknameStack.spacing = 10
        nicknameStack.axis = .vertical
        
        view.addSubview(nicknameStack)
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
            make.left.equalTo(nicknameStack.snp.left)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
        }
        
        nicknameStack.snp.makeConstraints { make in
            make.top.equalTo(instructions.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view).multipliedBy(0.9)
        }
    }
    
    @objc private func goToNextScreen(){
        guard let navVC = navigationController else {return}
        navVC.pushViewController(avatarVC, animated: true)
    }
}


