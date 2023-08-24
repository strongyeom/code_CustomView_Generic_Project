//
//  ViewController.swift
//  code_CustomView_Generic_Project
//
//  Created by 염성필 on 2023/08/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let netflexDetailButton = settingButton(text: "넷플릭스 상세화면 바로가기")
    let loginButton = settingButton(text: "로그인 화면 바로가기")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(netflexDetailButton)
        view.addSubview(loginButton)
        
        netflexDetailButton.addTarget(self, action: #selector(netDetailBtnClicked), for: .touchUpInside)
        netflexDetailButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
        }
        loginButton.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(netflexDetailButton.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(netflexDetailButton)
            make.height.equalTo(50)
        }
        
    }
    
    @objc func netDetailBtnClicked() {
        print("넷플 화면 클릭 됨")
        gotoTransition(view: NetflexDetailViewController())
    }
    
    @objc func loginBtnClicked() {
        print("로그인 화면 클릭 됨")
        gotoTransition(view: LoginViewController())
    }
    
    
    
    
    static func settingButton(text: String) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1
        return button
    }


}

