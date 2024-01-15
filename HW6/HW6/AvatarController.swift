//
//  AvatarController.swift
//  HW6
//
//  Created by Александра Среднева on 12.01.24.
//

import UIKit

class AvatarController: UIViewController {
    
    weak var delegate : SentData?
    
    private let instructions = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let bug = UIImageView()
    private let human = UIImageView()
    private let crown = UIImageView()
    private let star = UIImageView()

    private let firstRowStack = UIStackView()
    private let secondRowStack = UIStackView()
    private let avatarStack = UIStackView()
    
    private var imageName = ""
    
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
        instructions.text = "Choose avatar"
        instructions.textColor = .black
        instructions.font = .systemFont(ofSize: 18)
        instructions.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(instructions)
    }
    
    private func setUpBug(){
        bug.image = UIImage(named: "bug")
        bug.accessibilityIdentifier = "bug"
        configureGestureRecognizer(for: bug)

        view.addSubview(bug)
    }
    
    private func setUpHuman(){
        human.image = UIImage(named: "human")
        human.accessibilityIdentifier = "human"
        configureGestureRecognizer(for: human)
        
        view.addSubview(human)
    }
    
    private func setUpCrown(){
        crown.image = UIImage(named: "crown")
        crown.accessibilityIdentifier = "crown"
        configureGestureRecognizer(for: crown)
        
        view.addSubview(crown)
    }
    
    private func setUpStar(){
        star.image = UIImage(named: "star")
        star.accessibilityIdentifier = "star"
        configureGestureRecognizer(for: star)
        
        view.addSubview(star)
    }
    
    private func setUpStack(){
        setUpBug()
        setUpHuman()
        setUpCrown()
        setUpStar()

        firstRowStack.axis = .horizontal
        firstRowStack.distribution = .fillEqually
        firstRowStack.addArrangedSubview(bug)
        firstRowStack.addArrangedSubview(human)
        secondRowStack.distribution = .fillEqually
        secondRowStack.axis = .horizontal
        secondRowStack.addArrangedSubview(crown)
        secondRowStack.addArrangedSubview(star)
        
        avatarStack.addArrangedSubview(firstRowStack)
        avatarStack.addArrangedSubview(secondRowStack)
        avatarStack.distribution = .fillEqually
        avatarStack.spacing = 10
        avatarStack.axis = .vertical
        
        view.addSubview(avatarStack)
    }
    
    private func configureGestureRecognizer(for image: UIImageView){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToNextScreen))
        tapGesture.numberOfTapsRequired = 1
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tapGesture)
    }

    private func setUpConstraints(){
        instructions.snp.makeConstraints { make in
            make.left.equalTo(avatarStack.snp.left).offset(15)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
        }
        
        avatarStack.snp.makeConstraints { make in
            make.top.equalTo(instructions.snp.bottom).offset(20)
            make.left.right.equalTo(view)
            make.height.equalTo(view.snp.height).dividedBy(2)
        }
    }
    
    @objc private func goToNextScreen(sender: UITapGestureRecognizer){
        if let chosenImage = sender.view as? UIImageView {
            if let chosenImageID = chosenImage.accessibilityIdentifier {
                if let imageToSend = UIImage(named: chosenImageID){
                    guard let menuVC = navigationController?.viewControllers[1] else {return}
                    guard let navVC = navigationController else {return}
                    delegate?.didSelectImage(image: imageToSend)
                    navVC.popToViewController(menuVC, animated: true)
                }
            }
        }
    }
}
