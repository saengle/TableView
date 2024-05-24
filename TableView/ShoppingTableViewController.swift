//
//  ShoppingTableViewController.swift
//  TableView
//
//  Created by 쌩 on 5/23/24.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    var myShoppingList = [(String, Bool, Bool)]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myShoppingList.append(contentsOf: [("그립톡 구매하기", true, true), ("사이다 구매", false, false), ("아이패드 케이스 최저가 알아보기", false, true), ("양말", false, true)])
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myShoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppintCell", for: indexPath)
        cell
        return cell
    }
}

extension ShoppingTableViewController {
    
    
    
    func checkStar(_: Bool) {
        
    }
    
    func checkCheckBox(_: Bool) {
        
    }
}

class ShoppingCell: UITableViewCell {
    
    @IBOutlet var contentLabel: UILabel!
    
    // [checkButton, starButton]
    @IBOutlet var buttonCollection: [UIButton]!
    
    func setUI(_: ()) {
        
    }
    
}
