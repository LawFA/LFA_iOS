//
//  UserCaseViewController.swift
//  LFA_iOS
//
//  Created by 김강현 on 11/23/23.
//

import UIKit
import SnapKit
import SwiftUI
import Then

class UserCaseViewController: UIViewController {
    
    private let categoryList: [String] = ["난민", "장애인", "청소년", "성소수자", "노동"]
    
    private let headTitle = UILabel().then {
        $0.text = "사건 작성"
        $0.font = UIFont.pretendard(.bold, size: 20)
        $0.textColor = .black
    }
    
    private let categoryLabel : UILabel = {
        let label = UILabel()
        label.text = "카테고리"
        label.font = UIFont.pretendard(.semiBold, size: 14)
        label.textColor = UIColor(hex: "24252E")
        return label
    }()
    
    private let categoryBottomLabel = UILabel().then {
        $0.text = "사건에 해당하는 분류를 선택해주세요"
        $0.font = UIFont.pretendard(.semiBold, size: 14)
        $0.textColor = UIColor(hex: "#6E707B")
    }
    
    private let categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 6
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        $0.isScrollEnabled = false
        $0.collectionViewLayout = layout
        $0.backgroundColor = .white
        $0.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
    }
    
    private let caseTitleLabel = UILabel().then {
        $0.text = "사건 제목"
        $0.font = UIFont.pretendard(.semiBold, size: 14)
        $0.textColor = UIColor(hex: "24252E")
    }
    
    private let caseTitleTF = UITextField().then {
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(hex: "#F1F3FA").cgColor
        $0.backgroundColor = UIColor(hex: "#F1F3FA")
        $0.placeholder = "제목을 입력하세요"
        $0.addLeftPadding()
    }
    
    private let caseDescriptionLabel = UILabel().then {
        $0.text = "사건 개요"
        $0.font = UIFont.pretendard(.semiBold, size: 14)
        $0.textColor = UIColor(hex: "24252E")
    }
    
    // placeholder가 있으면 좋음
    private let descriptionTextView = UITextView().then {
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(hex: "#F1F3FA").cgColor
        $0.backgroundColor = UIColor(hex: "#F1F3FA")
    }
    
    private lazy var nextButton = UIButton().then {
        $0.backgroundColor = UIColor(hex: "b0e7ff")
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.textAlignment = .center
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.clear.cgColor
        $0.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        $0.setBackgroundColor(.lightGray, for: .highlighted)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
    }
    
    private func setUI() {
        [headTitle, categoryLabel, categoryBottomLabel, categoryCollectionView, caseTitleLabel, caseTitleTF, caseDescriptionLabel, descriptionTextView, nextButton].forEach({self.view.addSubview($0)})
        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.dataSource = self
        
        headTitle.snp.makeConstraints({
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        })
        
        categoryLabel.snp.makeConstraints({
            $0.top.equalTo(self.headTitle.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
        })
        
        categoryBottomLabel.snp.makeConstraints({
            $0.top.equalTo(self.categoryLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
        })
        
        categoryCollectionView.snp.makeConstraints({
            $0.top.equalTo(self.categoryBottomLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(75)
        })
        
        caseTitleLabel.snp.makeConstraints({
            $0.top.equalTo(self.categoryCollectionView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(16)
        })
        
        caseTitleTF.snp.makeConstraints({
            $0.top.equalTo(self.caseTitleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        })
        
        caseDescriptionLabel.snp.makeConstraints({
            $0.top.equalTo(self.caseTitleTF.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
        })
        
        descriptionTextView.snp.makeConstraints({
            $0.top.equalTo(self.caseDescriptionLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(250)
        })
        
        nextButton.snp.makeConstraints({
            $0.top.equalTo(self.descriptionTextView.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        })
    }
    
    @objc private func nextButtonTapped() {
        let alert = UIAlertController(title: "알림", message: "작성이 완료되었습니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default) { action in
            print("ok")
        })
        self.present(alert, animated: true, completion: nil)

    }
    
}

extension UserCaseViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else {return UICollectionViewCell()}
        cell.textLabel.text = categoryList[indexPath.item]
        return cell
    }
}

extension UserCaseViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
            cell.contentView.backgroundColor = UIColor(hex: "b0e7ff")
            cell.textLabel.textColor = .white
        } else {
            
        }
    }
}

extension UserCaseViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel().then {
            $0.font = UIFont.pretendard(.medium, size: 14)
            $0.text = categoryList[indexPath.item]
            $0.textColor = .black
            $0.sizeToFit()
        }
        let size = label.frame.size
        return CGSize(width: size.width + 40, height: size.height + 16)
    }
}

extension UserCaseViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

//#Preview {
//    UserCaseViewController().toPreview()
//}
