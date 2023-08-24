//
//  BottomView.swift
//  code_CustomView_Generic_Project
//
//  Created by 염성필 on 2023/08/25.
//

import UIKit
import SnapKit


class BottomView: UIView {
    
    

    
    
    let previewLabel = {
       let label = UILabel()
        label.text = "미리보기"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    let firstImage = settingImage(imageName: "firstImage")
    let secondImage = settingImage(imageName: "secondImage")
    let thirdImage = settingImage(imageName: "thirdImage")
    
    
    lazy var stackView = {
        let stack = UIStackView(arrangedSubviews: [firstImage, secondImage, thirdImage])
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        return stack
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        
        addSubview(previewLabel)
        addSubview(stackView)

        firstImage.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(firstImage.snp.width)
        }
        
        secondImage.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(secondImage.snp.width)
        }
        thirdImage.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(secondImage.snp.width)
        }
        
        previewLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(previewLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview()
        }
        
        DispatchQueue.main.async {

            [self.firstImage, self.secondImage, self.thirdImage].forEach {
                $0.layer.cornerRadius = $0.frame.width / 2
            }
        }
        

       
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        [self.firstImage, self.secondImage, self.thirdImage].forEach {
//            $0.layer.cornerRadius = self.firstImage.frame.width / 2
//            $0.clipsToBounds = true
//        }
    }
    
    
    
    static func settingImage(imageName: String) -> UIImageView {
            let image = UIImageView()
        image.backgroundColor = .red
            image.contentMode = .scaleToFill
            image.image = UIImage(named: imageName)
            image.layer.borderColor = UIColor.red.cgColor
            image.layer.borderWidth = 1
        image.clipsToBounds = true
            return image
    }
    
    
}
