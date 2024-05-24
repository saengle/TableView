//
//  HateViewController.swift
//  TableView
//
//  Created by 쌩 on 5/23/24.
//

import UIKit

class HateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("세컨드 :", #function)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("세컨드 :",#function)
    }
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        print("세컨드 :",#function)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("세컨드 :",#function)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("세컨드 :", #function)
    }

    @IBAction func hateButtonClicked(_ sender: UIButton) {
        let before = UserDefaults.standard.integer(forKey: "짜증나")
        let now = before + 1
        
        UserDefaults.standard.set(now, forKey: "짜증나")
        print(now)
        
    }
}
