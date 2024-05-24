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
        // 테이블 뷰 셀 전체의 높이 한번에 설정하기.
//        tableView.rowHeight = 70

    }
    // 1. 셀의 갯수(필수): numberOfRowsInSection
    // ex. 카톡 친구 100명
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        if section == 0 {
            rows = list.count
        } else if section == 1 {
            rows = 3
        }
        return rows
    }
    
    // 2. 셀의 높이(옵션): heightForRowAt
    // default 높이 = 44
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return indexPath.section == 0 ? 80 : 65
        return 70
    }
    
    // 3. 셀의 디자인 및 데이터 처리 (필수): cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function, indexPath)
        // 1) 사용할 cell 결정
        // 재사용 메커니즘
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondType")!
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstType")!
            cell.imageView?.image = UIImage(systemName: "star.fill")
            cell.textLabel?.text = "청년취업사관학교 영등포캠퍼스"
            cell.textLabel?.textColor = .brown
            cell.textLabel?.font = .boldSystemFont(ofSize: 30)
            
            cell.textLabel?.text = list[indexPath.row]
            
        } else {
            
            cell.imageView?.image = UIImage(systemName: "plus")
            cell.textLabel?.text = "우에에에엥?"
            cell.textLabel?.textColor = .blue
            cell.textLabel?.font = .boldSystemFont(ofSize: 30)
        }
        cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray.withAlphaComponent(0.2) : .white
        cell.detailTextLabel?.text = "iOS 앱개발자 데뷔과정"
        cell.detailTextLabel?.textColor = .lightGray
        cell.detailTextLabel?.font = .boldSystemFont(ofSize: 20)
        
        
        return cell
    }
    // 4. section의 갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    // 5. section Header title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title: String = section == 0 ? "Apple" : "Mentor"
        return title
    }
    
    
    
}

