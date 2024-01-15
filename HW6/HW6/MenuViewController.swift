//
//  MenuViewController.swift
//  HW6
//
//  Created by Александра Среднева on 12.01.24.
//

import UIKit

//struct probaData {
//    let image: UIImageView?
//    let label: UILabel?
//    let gender: String?
//}



class MenuViewController: UIViewController {
    
    weak var delegate: ViewController?
    private let genderVC = GenderController()
   
    private let userImage = UIImageView()
    private var userGender = String()
    private let placeholder = UILabel()
    private let userName = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let saveButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let buttonsStack = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userImage.layer.cornerRadius = userImage.frame.height / 2
    }
    
    private func setupUI() {
        setUpImage()
        setUpPlaceholder()
        setUpUsername()
        setUpButtonStack()
        setupConstraints()
    }
    
    private func setUpImage(){
        userImage.clipsToBounds = true
        userImage.layer.borderWidth = 2
        userImage.layer.borderColor = UIColor.purple.cgColor
        userImage.backgroundColor = #colorLiteral(red: 0.9406403899, green: 0.9406403899, blue: 0.9406403899, alpha: 1)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(userImage)
    }
    
    private func setUpPlaceholder(){
        placeholder.text = "No Image"
        placeholder.textColor = .black
        placeholder.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(placeholder)
    }
    
    private func setUpUsername(){
        userName.text = "No Name"
        userName.textColor = .black
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.font = .systemFont(ofSize: 22)
        
        view.addSubview(userName)
    }
    
    private func setUpButtonStack()  {
        setUpSaveButton()
        setUpEditButton()
        setUpCancelButton()
        buttonsStack.axis = .vertical
        buttonsStack.addArrangedSubview(saveButton)
        buttonsStack.addArrangedSubview(editButton)
        buttonsStack.addArrangedSubview(cancelButton)
        buttonsStack.spacing = 10
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsStack)
    }
    
    private func setUpSaveButton(){
        configButton(button: saveButton, title: "Save", bgColor: .purple, titleColour: .white)
    }
    
    private func setUpEditButton(){
        configButton(button: editButton, title: "Edit", borderWidth: 2, borderColor: UIColor.purple.cgColor, titleColour: .purple)
        editButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
    }
    
    private func setUpCancelButton(){
        configButton(button: cancelButton, title: "Cancel", titleColour: .purple)
        cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
    }
    
    func configButton(button: UIButton, title: String, bgColor: UIColor = .white, borderWidth: CGFloat = 0, borderColor: CGColor = UIColor.white.cgColor, titleColour: UIColor){
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColour, for: .normal)
        button.backgroundColor = bgColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
        button.layer.cornerRadius = 10
       
        view.addSubview(button)
    }
    
    private func setupConstraints() {
        userImage.snp.makeConstraints { make in
            make.height.equalTo(view.snp.height).multipliedBy(0.3)
            make.width.equalTo(userImage.snp.height)
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.safeAreaLayoutGuide.snp.centerY).multipliedBy(0.7)
        }
        
        placeholder.snp.makeConstraints { make in
            make.center.equalTo(userImage)
        }
        
        userName.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(userImage.snp.bottom).offset(20)
        }

        buttonsStack.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width).multipliedBy(0.65)
            make.bottom.equalTo(view).offset(-15)
        }
    }
    
    @objc private func goToNextScreen(){
        guard let navVC = navigationController else {return}
        genderVC.delegate = self
        navVC.pushViewController(genderVC, animated: true)
    }
    
    @objc private func cancelAction(){
        navigationController?.popViewController(animated: true)
    }
}

extension MenuViewController: SentData {

    func didEnterLabel(label: String) {
        userName.text = label
    }
    
    func didSelectImage(image: UIImage) {
        userImage.image = image
    }
    
//    func sendData(data: [String]) {
//        userImage.image = UIImage(named: data[0])
//        userName.text = data[1]
//    }
    
//    func sendStruct(data: probaData) {
//        userImage.image = data.image?.image
//        userName.text = data.label?.text
//    }
}
