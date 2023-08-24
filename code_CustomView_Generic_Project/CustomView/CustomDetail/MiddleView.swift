//
//  MiddleView.swift
//  code_CustomView_Generic_Project
//
//  Created by 염성필 on 2023/08/25.
//

import UIKit
import SnapKit

class MiddleView: UIView {
    
    
    let jjiMBtn = settingVerticalBtn(text: "내가 찜한 컨텐츠", imageTitle: "checkmark")
    let playBtn = settingHorizantalBtn(text: "재생", imageTitle: "play.fill")
    let infoBtn = settingVerticalBtn(text: "정보", imageTitle: "info.circle")
    
//    lazy var stackView = {
//        let stack = UIStackView(arrangedSubviews: [jjiMBtn, playBtn, infoBtn])
//        stack.axis = .horizontal
//        stack.spacing = 10
//        stack.alignment = .fill
//        stack.distribution = .equalSpacing
//        return stack
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        [jjiMBtn, playBtn, infoBtn].forEach {
            addSubview($0)
        }
        
        jjiMBtn.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.trailing.equalTo(playBtn.snp.leading).offset(-20)
        }
        
        playBtn.snp.makeConstraints { make in
            
            make.centerY.equalTo(jjiMBtn)
            make.centerX.equalToSuperview()
        }
        
        infoBtn.snp.makeConstraints { make in
            make.leading.equalTo(playBtn.snp.trailing).offset(30)
            make.top.trailing.equalToSuperview()
           // make.width.equalTo(50)
            //make.height.equalTo(infoBtn.snp.width).multipliedBy(1.3)
        }
        
    }
    
    static func settingVerticalBtn(text: String, imageTitle: String) -> UIButton {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseForegroundColor = .white
        config.imagePlacement = .top
        config.title = text
        config.image = UIImage(systemName: imageTitle)
        config.buttonSize = .large
        config.imagePadding = 5
        config.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3)
        config.baseBackgroundColor = .clear
        button.configuration = config
        return button
    }
    
    static func settingHorizantalBtn(text: String, imageTitle: String) -> UIButton {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseForegroundColor = .white
        config.imagePlacement = .leading
        config.title = text
        config.image = UIImage(systemName: imageTitle)
        config.buttonSize = .large
        config.imagePadding = 5
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 12, bottom: 5, trailing: 12)
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        
        button.configuration = config
        return button
    }
}
