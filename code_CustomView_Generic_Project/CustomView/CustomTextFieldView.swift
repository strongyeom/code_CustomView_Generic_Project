//
//  CustomTextFieldView.swift
//  code_CustomView_Generic_Project
//
//  Created by 염성필 on 2023/08/24.
//

import UIKit
import SnapKit

class CustomTextFieldView: UITextField {
    
    var placeHolderText: String
    
    init(frame: CGRect, placeHolderText: String) {
        self.placeHolderText = placeHolderText
        super.init(frame: frame)
        configure()
        self.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.borderStyle = .none
        self.backgroundColor = .gray
        self.layer.cornerRadius = 8
        self.textAlignment = .center
        self.font = .boldSystemFont(ofSize: 15)
        self.attributedPlaceholder =
        NSAttributedString(string: placeHolderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
}
