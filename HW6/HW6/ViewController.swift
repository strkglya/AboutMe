
import UIKit
import SnapKit

class ViewController: UIViewController {

    private let userImage = UIImageView()
    private let placeholder = UILabel()
    private let userName = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let customizeButton = UIButton()
    private let editButton = UIButton()
    private let cancelButton = UIButton()
    private let saveButton = UIButton()

    private var isNewScreen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        //setUpScreen()
        //isNew()
    }
    func setupUI() {
        setUpImage()
        setUpPlaceholder()
        setupConstraints()
    }

    func setUpImage(){
        userImage.clipsToBounds = true
        userImage.layer.borderWidth = 2
        userImage.layer.borderColor = UIColor.purple.cgColor
        userImage.backgroundColor = #colorLiteral(red: 0.9406403899, green: 0.9406403899, blue: 0.9406403899, alpha: 1)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(userImage)
    }
    
    func setUpPlaceholder(){
        placeholder.text = "No Image"
        placeholder.textColor = .black
        placeholder.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(placeholder)
    }
        func setupConstraints() {
            userImage.snp.makeConstraints { make in
                make.height.equalTo(view.snp.height).multipliedBy(0.3)
                make.width.equalTo(userImage.snp.height)
                make.centerX.equalTo(view.snp.centerX)
                make.centerY.equalTo(view.safeAreaLayoutGuide.snp.centerY).multipliedBy(0.7)
            }
            
            placeholder.snp.makeConstraints { make in
                make.center.equalTo(userImage)
            }
        }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userImage.layer.cornerRadius = userImage.frame.height / 2
    }
//    private func setUpScreen() {
//        userImage.snp.makeConstraints { make in
//            make.width.equalTo(300)
//            make.height.equalTo(300)
//            make.center.equalTo(view.center)
//        }
//        
//        //userImage.layer.cornerRadius = userImage.frame.size.width/2
//        
//        
//        placeholder.text = "No Image"
//        
//        customizeButton.layer.borderWidth = 1
//        customizeButton.layer.borderColor = UIColor.purple.cgColor
//        customizeButton.layer.cornerRadius = 10
//        customizeButton.setTitleColor(.purple, for: .normal)
//        
//        view.addSubview(userImage)
//        view.addSubview(placeholder)
//        view.addSubview(customizeButton)
//    }
    
//    private func isNew(){
//        if isNewScreen {
//            saveButton.isHidden = false
//            editButton.isHidden = false
//            cancelButton.isHidden = false
//            customizeButton.isHidden = true
//        } else {
//            saveButton.isHidden = true
//            editButton.isHidden = true
//            cancelButton.isHidden = true
//        }
//    }
    
//    @IBAction func customizeAction(_ sender: Any) {
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let secondVC = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {return}
//        secondVC.isNewScreen = true
//        present(secondVC, animated: true)
//    }
}

