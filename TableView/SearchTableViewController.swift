//
//  SearchTableViewController.swift
//  TableView
//
//  Created by 쌩 on 5/24/24.
//

import UIKit

struct Travel {
    let country: String
    let money: Int
    var like: Bool
}

class SearchTableViewController: UITableViewController {

    var list = [
        Travel(country: "프랑스", money: 102224643560, like: false),
        Travel(country: "일본", money: 101567578, like: false),
        Travel(country: "독일", money: 10123434250, like: false),
        Travel(country: "스위스", money: 111524645388880, like: true)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120 // cell들의 높이 120으로 설정
        print(#function)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //type
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        
        let data = list[indexPath.row]
        
        cell.titleLabel.text = data.country
        cell.titleLabel.font = .boldSystemFont(ofSize: 30)
        
        cell.subtitleLabel.font = .systemFont(ofSize: 14)
        cell.subtitleLabel.textColor = .darkGray
        
        cell.posterImageView.layer.cornerRadius = 10
        cell.posterImageView.backgroundColor = .lightGray
        
        let image = data.like ? "thumbsup" : "thumbsup.fill"
        cell.thumbsUpButton.setImage(UIImage(systemName: image), for: .normal)
        
        cell.thumbsUpButton.addTarget(self, action: #selector(thumbsUpClicked), for: .touchUpInside)
        cell.thumbsUpButton.tag = indexPath.row
        
        return cell
    }
    
    @objc func thumbsUpClicked(sender: UIButton) {
        list[sender.tag].like.toggle()
        tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    
}
