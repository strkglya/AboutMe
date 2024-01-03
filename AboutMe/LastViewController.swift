import UIKit
import SnapKit

class LastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.3027401567, green: 0.6057469845, blue: 1, alpha: 1)

        let catInfo = UIStackView()
        catInfo.axis = .horizontal
        catInfo.distribution = .fill
        catInfo.spacing = 10

        let catPhotoStack = UIStackView()
        catPhotoStack.axis = .vertical
        catPhotoStack.alignment = .center
        catPhotoStack.distribution = .fillEqually
        catPhotoStack.spacing = 2

        let aboutCat = UILabel()
        aboutCat.text = "А еще у меня есть кот, его зовут Рамзи. Он любит заполнять товарно-транспортные накладные, есть бумажки и грызться"
        aboutCat.numberOfLines = 0
        aboutCat.textColor = .white
        aboutCat.textAlignment = .center
        aboutCat.font = UIFont(name: "AvenirNext-Medium", size: 18)
        aboutCat.sizeToFit()

        let catOnChair = UIImageView(image: UIImage(named: "catOnChair"))
        catOnChair.contentMode = .scaleToFill

        let catWorking = UIImageView(image: UIImage(named: "catWorking"))
        catWorking.contentMode = .scaleToFill

        let catSmoking = UIImageView(image: UIImage(named: "catSmoking"))
        catSmoking.contentMode = .scaleToFill

        catPhotoStack.addArrangedSubview(catOnChair)
        catPhotoStack.addArrangedSubview(catWorking)
        catPhotoStack.addArrangedSubview(catSmoking)

        catInfo.addArrangedSubview(catPhotoStack)
        catInfo.addArrangedSubview(aboutCat)

        view.addSubview(catInfo)

        catInfo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.bottom.equalTo(-60)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }

        catPhotoStack.snp.makeConstraints { make in
            make.width.equalTo(catInfo.snp.width).multipliedBy(0.6)
        }
    }
}
