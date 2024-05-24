//
//  RealTodoTableViewController.swift
//  TableView
//
//  Created by 쌩 on 5/24/24.
//

import UIKit

class RealTodoTableViewController: UITableViewController {

    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    var list = ["장보기", "혹성탈출하기", "범죄도시보기", "꿀잠자기", "밥먹기"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //전체 cell의 높이 50 고정
        tableView.rowHeight = 50
        addButton.addTarget(self, action: #selector(addList), for: .touchUpInside)
        
    }
    
    @objc private func addList() {
        // for use textfield, Do some validation check.
        if addTextField.text == " " {
            addTextField.text = ""
        }
        guard var todo = addTextField.text, todo.count > 1 else {
            return
        }
        list.append(todo)
        // after use textfield, it have to be cleaned
        addTextField.text = ""
        
        tableView.reloadData()
    }
    // implicit return : 딱 한줄일 경우에 return을 암묵적으로 생략 가능
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RealTodoCell")!
        cell.textLabel?.text = list[indexPath.row]
        cell.detailTextLabel?.text = "ㅁㄴㅇㅂㄷㅅ"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        list.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
}
