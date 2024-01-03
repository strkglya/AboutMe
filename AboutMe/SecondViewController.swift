//
//  SecondViewController.swift
//  AboutMe
//
//  Created by Александра Среднева on 30.12.23.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {

    let thirdVC = ThirdViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.3027401567, green: 0.6057469845, blue: 1, alpha: 1)
        
        let aboutBirth = UILabel()
        aboutBirth.text = "Я родилась 19-го октября 2002 года, натальная карта прилагается)"
        aboutBirth.numberOfLines = 0
        aboutBirth.textColor = .white
        aboutBirth.textAlignment = .center
        aboutBirth.font = UIFont(name: "AvenirNext-Medium", size: 28)
        aboutBirth.sizeToFit()
        view.addSubview(aboutBirth)
        
        let nextScreenButton = UIButton()
        nextScreenButton.setTitle("Дальше", for: .normal)
        nextScreenButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        view.addSubview(nextScreenButton)
        
        let bitrhChat = UIImageView(image: UIImage(named: "birthChart"))
        bitrhChat.contentMode = .scaleAspectFit
        view.addSubview(bitrhChat)
        
        
        aboutBirth.translatesAutoresizingMaskIntoConstraints = false
        aboutBirth.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(bitrhChat.snp_topMargin).offset(-20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        bitrhChat.translatesAutoresizingMaskIntoConstraints = false
        bitrhChat.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(50)
            make.height.equalTo(view).multipliedBy(0.5)
            make.left.equalTo(40)
            make.right.equalTo(-40)
        }
        
        nextScreenButton.translatesAutoresizingMaskIntoConstraints = false
        nextScreenButton.snp.makeConstraints { make in
            make.top.equalTo(bitrhChat.snp_bottomMargin).offset(40)
            make.width.equalTo(100)
            make.centerX.equalTo(view)
            make.bottom.equalTo(-20)
        }
    }
    
    @objc private func nextScreen(){
        guard let navVC = navigationController else {return}
        navVC.pushViewController(thirdVC, animated: true)
    }
}
