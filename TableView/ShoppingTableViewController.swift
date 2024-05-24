//
//  ShoppingTableViewController.swift
//  TableView
//
//  Created by 쌩 on 5/23/24.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    
    var myShoppingList = [Shopping(content: "그립톡 구매하기", check: true, star: true),Shopping(content: "커피 캡슐 미리 사두기", check: true, star: true),Shopping(content: "애플워치 구매", check: true, star: true),Shopping(content: "빨대 구매", check: true, star: true),Shopping(content: "전등 구매", check: true, star: true)]
    
    
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
        print(tableView.numberOfSections, tableView.numberOfRows(inSection: 0))
    }

    private func addTarget() {
        addButton.addTarget(self, action: #selector(addShoppingList), for: .touchUpInside)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myShoppingList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as? ShoppingTableViewCell else {
            return UITableViewCell()
        }
        let data = myShoppingList[indexPath.row]
        
        cell.contentLabel.text = data.content

        let checkButtonImage = data.check ? UIImage(systemName: "checkmark.square.fill") :  UIImage(systemName: "checkmark.square")
        cell.checkButton.setImage(checkButtonImage, for: .normal)
        cell.checkButton.addTarget(self, action: #selector(checkChange), for: .touchUpInside)
        cell.checkButton.tag = indexPath.row
        
        
        let starButtonImage = data.star ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        cell.starButton.setImage(starButtonImage, for: .normal)
        cell.starButton.addTarget(self, action: #selector(starChange), for: .touchUpInside)
        cell.starButton.tag = indexPath.row
      
        
        return cell
    }
}

extension ShoppingTableViewController {
    @objc func addShoppingList() {
        // add validation
        guard let text = addTextField.text else { return }
        
        myShoppingList.append(Shopping(content: text, check: false, star: false))
//        self.tableView.reloadRows(at: [IndexPath(row: myShoppingList.count - 2 , section: 0)], with: .automatic)
        tableView.reloadData()
    }
    
    @objc func checkChange(sender: UIButton) {
        self.myShoppingList[sender.tag].check.toggle()
        self.tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
        
    }

    @objc func starChange(sender: UIButton) {
        self.myShoppingList[sender.tag].star.toggle()
        self.tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    
}
