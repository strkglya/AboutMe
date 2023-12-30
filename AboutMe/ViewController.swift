//
//  ViewController.swift
//  AboutMe
//
//  Created by Александра Среднева on 30.12.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let box = UIView()
        box.backgroundColor = .blue
        view.addSubview(box)
        box.translatesAutoresizingMaskIntoConstraints = false
        
        box.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(self.view)
        }
        // Do any additional setup after loading the view.
    }


}

