//
//  TopAreaView.swift
//  code_CustomView_Generic_Project
//
//  Created by 염성필 on 2023/08/25.
//

import UIKit
import SnapKit

class TopAreaView: UIView {
    
    let bannerLabel = {
        let label = UILabel()
        label.text = "N"
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let tvLabel = settingLabel(text: "TV 프로그램")
    let movieLabel = settingLabel(text: "영화")
    let jjiMLabel = settingLabel(text: "내가 찜한 콘텐츠")
    
    lazy var stackView = {
       let stack = UIStackView(arrangedSubviews: [tvLabel, movieLabel, jjiMLabel])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        confiure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func confiure() {
        self.addSubview(bannerLabel)
        self.addSubview(stackView)
        
        bannerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(15)
            make.leading.equalTo(bannerLabel.snp.trailing).offset(30)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-30)
        }
        
        
    }
    
    
    static func settingLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        return label
    }
}
