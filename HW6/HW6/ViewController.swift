
import UIKit
import SnapKit

protocol SentData: AnyObject {
    func didEnterLabel(label: String)
    func didSelectImage(image: UIImage)
}

final class ViewController: UIViewController {
    
    private let menuVC = MenuViewController()
    
    let userImage = UIImageView()
    private let placeholder = UILabel()
    let userName = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let customizeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userImage.layer.cornerRadius = userImage.frame.height / 2
    }
    override func viewWillAppear(_ animated: Bool) {
        if userImage.image != nil {
            placeholder.isHidden = true
        } else {
            placeholder.isHidden = false
        }
    }
    
    private func setUpUI() {
        setUpImage()
        setUpPlaceholder()
        setUpUsername()
        setUpCustomizeButton()
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
    
    private func setUpCustomizeButton(){
        customizeButton.setTitle("Customize", for: .normal)
        customizeButton.setTitleColor(.purple, for: .normal)
        customizeButton.titleLabel?.font = .systemFont(ofSize: 18.0)
        customizeButton.layer.borderWidth = 2
        customizeButton.layer.borderColor = UIColor.purple.cgColor
        customizeButton.layer.cornerRadius = 10
        customizeButton.setTitleColor(.purple, for: .normal)
        customizeButton.translatesAutoresizingMaskIntoConstraints = false
        
        customizeButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        
        view.addSubview(customizeButton)
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
        
        customizeButton.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.55)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(userName.snp.bottom).offset(30)
        }
    }
    
    @objc private func goToNextScreen(){
        guard let navVC = navigationController else {return}
        menuVC.delegate = self
        menuVC.viewController = self
        navVC.pushViewController(menuVC, animated: true)
    }
}

extension ViewController: SentData {
    func didEnterLabel(label: String) {
        userName.text = label
    }
    
    func didSelectImage(image: UIImage) {
        userImage.image = image
    }
}
