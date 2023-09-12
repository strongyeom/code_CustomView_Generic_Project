//
//  LoginViewController.swift
//  code_CustomView_Generic_Project
//
//  Created by 염성필 on 2023/08/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let viewModel = NetFlexViewModel()
    
    let mainTitleLabel = {
       let label = UILabel()
        label.text = "JACKFLEX"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .red
        return label
    }()
    
    let emailTextField = CustomTextFieldView(frame: .zero, placeHolderText: "이메일 주소 또는 전화번호")
    let passwordTextField = CustomTextFieldView(frame: .zero, placeHolderText: "비밀번호")
    let nicknameTextField = CustomTextFieldView(frame: .zero, placeHolderText: "닉네임")
    let locationTextField = CustomTextFieldView(frame: .zero, placeHolderText: "위치")
    let recommendTextField = CustomTextFieldView(frame: .zero, placeHolderText: "추천 코드 입력")
    
    let signupBtn = {
       let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor = .white
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        return button
    }()
    
    let addInfoBtn = {
       let button = UIButton()
        button.setTitle("추가 정보 입력", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        return button
    }()
    
    let sw = {
        let s = UISwitch()
        s.isOn = true
        s.onTintColor = .orange
        return s
    }()
    
    
    lazy var stackView = {
       let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, nicknameTextField, locationTextField, recommendTextField])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setConstraints()
     
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func configureView() {
        view.backgroundColor = .black
        [mainTitleLabel, stackView, signupBtn, addInfoBtn, sw].forEach {
            view.addSubview($0)
        }
        
        emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
        signupBtn.addTarget(self, action: #selector(signupBtnClicked), for: .touchUpInside)
        nicknameTextField.addTarget(self, action: #selector(nicknameTextFieldChanged), for: .editingChanged)
        locationTextField.addTarget(self, action: #selector(locationTextFieldChanged), for: .editingChanged)
        recommendTextField.addTarget(self, action: #selector(recommendTextFieldChanged), for: .editingChanged)

        viewModel.email.bind { text in
            self.emailTextField.text = text
        }
        
        viewModel.password.bind { text in
            self.passwordTextField.text = text
        }
        
        viewModel.nickname.bind { text in
            self.nicknameTextField.text = text
        }

        viewModel.location.bind { text in
            self.locationTextField.text = text
        }

        viewModel.recommend.bind { text in
            self.recommendTextField.text = text
        }
        
        viewModel.isVaild.bind { isVaild in
            self.signupBtn.isEnabled = isVaild
            self.signupBtn.backgroundColor = isVaild ? .white : .lightGray
        }
        
        viewModel.isTextVaild.bind { isVaild in
            self.emailTextField.textColor = isVaild ? .green : .white
            self.passwordTextField.textColor = isVaild ? .green : .white
        }
        
    }
    
    @objc func signupBtnClicked() {
        // 성공할때만 가능함
        print("회원가입 버튼이 눌렸음 ")
    }
    
    @objc func emailTextFieldChanged() {
        viewModel.email.value = emailTextField.text!
       // viewModel.checkVaildation()
        // 두번 쓸 필요 없이 플로우순으로 한번만 만들면 됨
       // viewModel.emailAndPasswordVaildataion()
    }
    
    @objc func passwordTextFieldChanged() {
        viewModel.password.value = passwordTextField.text!
       // viewModel.checkVaildation()
        viewModel.emailAndPasswordVaildataion()
    }
    
    @objc func nicknameTextFieldChanged() {
        viewModel.nickname.value = nicknameTextField.text!
       // viewModel.checkVaildation()
    }
    
    @objc func locationTextFieldChanged() {
        viewModel.location.value = locationTextField.text!
       // viewModel.checkVaildation()
    }
    
    @objc func recommendTextFieldChanged() {
        viewModel.recommend.value = recommendTextField.text!
        viewModel.checkVaildation()
    }
    
    func setConstraints() {
        mainTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        signupBtn.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(stackView)
            make.height.equalTo(50)
            make.top.equalTo(stackView.snp.bottom).offset(10)
        }
        
        addInfoBtn.snp.makeConstraints { make in
            make.leading.equalTo(stackView.snp.leading)
            make.top.equalTo(signupBtn.snp.bottom).offset(10)
        }
        
        sw.snp.makeConstraints { make in
            make.trailing.equalTo(stackView.snp.trailing)
            make.top.equalTo(signupBtn.snp.bottom).offset(10)
        }
    }
    
    
    
    
}
