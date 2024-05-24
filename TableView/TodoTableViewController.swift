//
//  TodoTableViewController.swift
//  TableView
//
//  Created by 쌩 on 5/23/24.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var list = ["iOS", "iPadOS", "watchOS", "macOS" ,"기타"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // 1. 셀의 갯수(필수): numberOfRowsInSection
    // ex. 카톡 친구 100명
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    // 2. 셀의 높이(옵션): heightForRowAt
    // default 높이 = 44
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // 3. 셀의 디자인 및 데이터 처리 (필수): cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function, indexPath)
        // 1) 사용할 cell 결정
        // 재사용 메커니즘
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstType")!
        cell.imageView?.image = UIImage(systemName: "star.fill")
        cell.textLabel?.text = "청년취업사관학교 영등포캠퍼스"
        cell.textLabel?.textColor = .brown
        cell.textLabel?.font = .boldSystemFont(ofSize: 30)
        
        cell.textLabel?.text = list[indexPath.row]
        
        cell.detailTextLabel?.text = "iOS 앱개발자 데뷔과정"
        cell.detailTextLabel?.textColor = .green
        cell.detailTextLabel?.font = .boldSystemFont(ofSize: 20)
        
        
        return cell
    }
}

