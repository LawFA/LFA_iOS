//
//  DetailViewController.swift
//  LFA_iOS
//
//  Created by 김강현 on 11/23/23.
//

import UIKit
import SnapKit
import Then

class DetailViewController: UIViewController {
    
    private let titleLabel = UILabel().then {
        $0.text = "호모인테르"
        $0.textColor = .black
        $0.font = UIFont.pretendard(.bold, size: 20)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        setUI()
    }
    

    private func setUI() {
        [titleLabel].forEach({self.view.addSubview($0)})
        
        titleLabel.snp.makeConstraints({
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.centerX.equalToSuperview()
        })
    }

}
