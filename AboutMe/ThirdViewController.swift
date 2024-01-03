
import UIKit
import SnapKit

class ThirdViewController: UIViewController {

    let lastVC = LastViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.3027401567, green: 0.6057469845, blue: 1, alpha: 1)

        let aboutMe = UILabel()
        aboutMe.text = "На данный момент заканчиваю БГУИР по специальности Электронный маркетинг (плохой опыт тоже опыт). \nЛюбимые книги - цикл Архив Буресвета, в особенности первая часть. \nУмею играть на скрипке, занимаюсь танцами, люблю медитативную работу по типу рисования или вязания\nВ людях ценю чувство юмора и эмоциональную зрелость, не ценю если они девы по знаку зодиака или если их зовут Кирилл"
        aboutMe.numberOfLines = 0
        aboutMe.textColor = .white
        aboutMe.textAlignment = .center
        aboutMe.font = UIFont(name: "AvenirNext-Medium", size: 18)
        aboutMe.sizeToFit()
        view.addSubview(aboutMe)
        
        let myPhoto = UIImageView(image: UIImage(named: "myPhoto"))
        myPhoto.contentMode = .scaleToFill
        view.addSubview(myPhoto)
        
        let nextScreenButton = UIButton()
        nextScreenButton.setTitle("Дальше", for: .normal)
        nextScreenButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        view.addSubview(nextScreenButton)
        
        
        myPhoto.translatesAutoresizingMaskIntoConstraints = false
        myPhoto.snp.makeConstraints { make in
            make.height.equalTo(view).multipliedBy(0.45)
            make.top.equalTo(view).offset(0)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
        
        aboutMe.translatesAutoresizingMaskIntoConstraints = false
        aboutMe.snp.makeConstraints { make in
            make.top.equalTo(myPhoto.snp_bottomMargin).offset(40)
            make.left.equalTo(20)
            make.right.equalTo(-20)
           // make.bottom.equalTo(nextScreenButton.snp_topMargin).offset(-20)
        }
        
        nextScreenButton.translatesAutoresizingMaskIntoConstraints = false
        nextScreenButton.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(aboutMe.snp_bottomMargin).offset(20)
            make.width.equalTo(100)
            make.centerX.equalTo(view)
            make.bottom.equalTo(-20)
        }
    }
    
    @objc private func nextScreen(){
        guard let navVC = navigationController else {return}
        navVC.pushViewController(lastVC, animated: true)
    }
}
