//
//  GroupHomeViewController.swift
//  LFA_iOS
//
//  Created by 김강현 on 11/23/23.
//

import UIKit
import SnapKit
import Then
import SwiftUI
import WebKit

class GroupHomeViewController: UIViewController {
    
    let categories = ["전체", "난민", "장애인", "청소년", "노동", "성소수자"]
    let groupCategories = [
        "공익활동가 사회적협동조합 동행",
        "사회연대은행(사) 함께만드는세상",
        "서울노동권익센터",
        "서울시 감정노동 종사자 권리보호센터",
        "서울시여성가족재단",
        "위드유 서울직장성희롱성폭력예방센터",
        "호모인테르"
    ]
    var collectionView: UICollectionView!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 40)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(GroupCategoryCell.self, forCellWithReuseIdentifier: "GroupCategoryCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        
        // tableView
        tableView = UITableView()
        tableView.register(GroupListCell.self, forCellReuseIdentifier: "GroupListCell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        // CollectionView 아래에 TableView 제약 조건 설정
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
}

extension GroupHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCategoryCell", for: indexPath) as! GroupCategoryCell
        cell.categoryButton.setTitle(categories[indexPath.item], for: .normal)
        return cell
    }
}

extension GroupHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 임시로 10개의 셀을 반환하도록 설정
        return groupCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupListCell", for: indexPath) as! GroupListCell
        //            cell.textLabel?.text = "Title \(indexPath.row)"
        cell.textLabel?.text = "\(groupCategories[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 웹뷰 컨트롤러 인스턴스화
        let webViewController = UIViewController()
        let webView = WKWebView(frame: webViewController.view.frame)
        webViewController.view.addSubview(webView)
        
        // URL을 로드하기
        if let url = URL(string: "https://www.seoulpa.kr/bbs/board.php?bo_table=partner_fair&wr_id=240&sfl=wr_content%7C%7Cwr_2&stx=%EB%85%B8%EB%8F%99&sop=or&page=2") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        // 웹뷰 컨트롤러를 현재 네비게이션 스택에 푸시
        if let navigator = navigationController {
            navigator.pushViewController(webViewController, animated: true)
        } else {
            present(webViewController, animated: true, completion: nil)
        }
    }
    
}

//#Preview {
//    GroupHomeViewController().toPreview()
//}


class GroupCategoryCell: UICollectionViewCell {
    
    var categoryButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        categoryButton = UIButton()
        categoryButton.titleLabel?.font = UIFont.pretendard(.semiBold, size: 16)
        categoryButton.setTitleColor(.black, for: .normal)
        categoryButton.backgroundColor = UIColor(hex: "b0e7ff")
        categoryButton.layer.cornerRadius = 8
        contentView.addSubview(categoryButton)
        
        categoryButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GroupListCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

