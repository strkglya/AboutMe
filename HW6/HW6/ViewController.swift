
import UIKit
import SnapKit

class ViewController: UIViewController {

    var userImage = UIImageView()
    var placeholder = UILabel()
    var userName = UILabel()
    var customizeButton = UIButton()
    var editButton = UIButton()
    var cancelButton = UIButton()
    var saveButton = UIButton()

    private var isNewScreen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreen()
        isNew()
    }
    
    private func setUpScreen() {
        
        
        
        userImage.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(300)
            make.center.equalTo(view.center)
        }
        
        //userImage.layer.cornerRadius = userImage.frame.size.width/2
        userImage.layer.masksToBounds = true
        userImage.layer.borderWidth = 2
        userImage.layer.borderColor = UIColor.purple.cgColor
        userImage.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        
        placeholder.text = "No Image"
        
        customizeButton.layer.borderWidth = 1
        customizeButton.layer.borderColor = UIColor.purple.cgColor
        customizeButton.layer.cornerRadius = 10
        customizeButton.setTitleColor(.purple, for: .normal)
        
        view.addSubview(userImage)
        view.addSubview(placeholder)
        view.addSubview(customizeButton)
    }
    
    private func isNew(){
        if isNewScreen {
            saveButton.isHidden = false
            editButton.isHidden = false
            cancelButton.isHidden = false
            customizeButton.isHidden = true
        } else {
            saveButton.isHidden = true
            editButton.isHidden = true
            cancelButton.isHidden = true
        }
    }
    
    @IBAction func customizeAction(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {return}
        secondVC.isNewScreen = true
        present(secondVC, animated: true)
    }
}

