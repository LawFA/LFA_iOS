//
//  AlarmListViewController.swift
//  LFA_iOS
//
//  Created by 김강현 on 11/23/23.
//

import UIKit
import SnapKit

class AlarmListViewController: UIViewController {
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        tableView = UITableView()
        tableView.register(AlarmListCell.self, forCellReuseIdentifier: "AlarmListCell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        // CollectionView 아래에 TableView 제약 조건 설정
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }

}

extension AlarmListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // 임시로 10개의 셀을 반환하도록 설정
            return 10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmListCell", for: indexPath)
            cell.textLabel?.text = "Title \(indexPath.row)"
            return cell
        }
}

class AlarmListCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
