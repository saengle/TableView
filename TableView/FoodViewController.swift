//
//  FoodViewController.swift
//  TableView
//
//  Created by 쌩 on 5/27/24.
//

import UIKit

import Kingfisher
/*
 1. 테이블 뷰 아웃렛 선언
 2. 테이블 뷰 부하 직원 선언: Protoccol
 3. 테비블 뷰와 부하직원 연결 (tableview.delegate = self (타입으로서의 Protocol)
 4. XIB cell: 여러 테이블뷰에 재사용
 5. XIB register
 */
class FoodViewController: UIViewController {
    
    let list = RestaurantList().restaurantArray
    var filteredList: [Restaurant] = []

    @IBOutlet var foodTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredList = list
        let left = UIBarButtonItem(title: "한식만", style: .plain, target: self, action: #selector(leftBarButtonClicked))
        let all = UIBarButtonItem(title: "전체보기", style: .plain, target: self, action: #selector(allBarButtonClicked))
        navigationItem.leftBarButtonItems = [left, all]
        
        searchBar.delegate = self
        
        foodTableView.rowHeight = 120
        foodTableView.delegate = self
        foodTableView.dataSource = self
        let xib = UINib(nibName: "FoodTableViewCell", bundle: nil)
        foodTableView.register( xib, forCellReuseIdentifier: "FoodTableViewCell")
    }
    

    @objc func leftBarButtonClicked() {
        //list > 반복문 > 한식 > 갱신
        var myList = list.filter{$0.category.contains("한식")}

        filteredList = myList
        
        foodTableView.reloadData()
    }
    
    @objc func allBarButtonClicked() {
        filteredList = list
        foodTableView.reloadData()
        showAlert(title: "전체보기로 설정하셨습니다.")
        
    }

}

extension FoodViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as? FoodTableViewCell else { return UITableViewCell() }
        
        let data = filteredList[indexPath.row]
        
        
        
//        cell.configureLayout()
        cell.configureCell(data: data)
        
        return cell
    }
}

//searchBar delegate.self 설정 해야함
extension FoodViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        
        let myList = list.filter{$0.name.contains(text) || $0.category.contains(text)}

        filteredList = myList
        foodTableView.reloadData()
    }
    
}
