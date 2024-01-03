//
//  ViewController.swift
//  AboutMe
//
//  Created by Александра Среднева on 30.12.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let secondVC = SecondViewController()
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.3027401567, green: 0.6057469845, blue: 1, alpha: 1)
        
        let greetings = UILabel()
        greetings.text = "Привет! \nМеня зовут Саша, и это моя визитка"
        greetings.numberOfLines = 0
        greetings.textColor = .white
        greetings.textAlignment = .center
        greetings.font = UIFont(name: "AvenirNext-Medium", size: 32)
        greetings.sizeToFit()
        view.addSubview(greetings)
        
        let nextScreenButton = UIButton()
        nextScreenButton.setTitle("Дальше", for: .normal)
        nextScreenButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        view.addSubview(nextScreenButton)

        greetings.translatesAutoresizingMaskIntoConstraints = false
        greetings.snp.makeConstraints { make in
            make.left.equalTo(40)
            make.right.equalTo(view).offset(-40)
            make.centerY.equalTo(view)
        }
        
        nextScreenButton.translatesAutoresizingMaskIntoConstraints = false
        nextScreenButton.snp.makeConstraints { make in
            make.bottom.equalTo(-20)
            make.width.equalTo(100)
            make.centerX.equalTo(view)
        }
    }
    
    @objc private func nextScreen(){
        guard let navVC = navigationController else {return}
        navVC.pushViewController(secondVC, animated: true)
    }
}

