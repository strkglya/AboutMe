
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var placeholder: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var customizeButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!

    private var isNewScreen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreen()
        isNew()
    }
    
    private func setUpScreen() {
        
        userImage.layer.cornerRadius = userImage.frame.size.width/2
        userImage.layer.masksToBounds = true
        userImage.layer.borderWidth = 2
        userImage.layer.borderColor = UIColor.purple.cgColor
        userImage.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        placeholder.text = "No Image"
        
        customizeButton.layer.borderWidth = 1
        customizeButton.layer.borderColor = UIColor.purple.cgColor
        customizeButton.layer.cornerRadius = 10
        customizeButton.setTitleColor(.purple, for: .normal)
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
        guard let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController else {return}
        vc.isNewScreen = true
        guard let navController = navigationController else {return}
        navController.pushViewController(vc, animated: true)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        print("save")
    }
    
    @IBAction func editAction(_ sender: Any) {
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
}

