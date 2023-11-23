//
//  ViewController.swift
//  LFA_iOS
//
//  Created by 김강현 on 11/23/23.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {
    
    private let titleLabel = UILabel().then {
        $0.text = "LAW FOR ALL"
        $0.textColor = .black
        $0.font = UIFont.pretendard(.bold, size: 40)
    }
    
    private let emailTF = UITextField().then {
        $0.backgroundColor = UIColor(hex: "#F7F8F9")
        $0.placeholder = "이메일을 입력하세요"
        $0.textColor = .black
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.addLeftPadding()
    }
    
    private let passwordTF = UITextField().then {
        $0.backgroundColor = UIColor(hex: "#F7F8F9")
        $0.placeholder = "비밀번호를 입력하세요"
        $0.textColor = .black
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.isSecureTextEntry = true
        $0.tag = 1
        $0.addLeftPadding()
    }
    
    private lazy var loginButton = UIButton().then {
        $0.backgroundColor = UIColor(hex: "b0e7ff")
        $0.setTitle("Login", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.textAlignment = .center
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.clear.cgColor
        $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
    }

    private func setUI() {
        [titleLabel, emailTF, passwordTF, loginButton].forEach({self.view.addSubview($0)})
        
        titleLabel.snp.makeConstraints({
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(100)
            $0.centerX.equalToSuperview()
        })
        
        emailTF.snp.makeConstraints({
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(56)
        })
        
        passwordTF.snp.makeConstraints({
            $0.top.equalTo(self.emailTF.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        })
        
        loginButton.snp.makeConstraints({
            $0.top.equalTo(self.passwordTF.snp.bottom).offset(90)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        })
    }
    
    @objc private func loginButtonTapped() {
        let tabVC = TabBarViewController()
        tabVC.modalPresentationStyle = .fullScreen
        self.present(tabVC, animated: true)
    }
}

extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
