//
//  HomeViewController.swift
//  LFA_iOS
//
//  Created by 김강현 on 11/23/23.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {
    
    private let titleLabel = UILabel().then {
        $0.text = "공익 단체 리스트"
        $0.font = UIFont.pretendard(.bold, size: 20)
        $0.textColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    private func setUI() {
        [titleLabel].forEach({self.view.addSubview($0)})
        
        titleLabel.snp.makeConstraints({
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
//            $0.leading.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
        })
    }
    
}
