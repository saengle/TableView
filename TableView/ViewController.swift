//
//  ViewController.swift
//  TableView
//
//  Created by 쌩 on 5/23/24.
//

import UIKit

class ViewController: UIViewController {

    var emotionTList = [("행복", 0), ("즐거워", 0), ("삼삼해", 0), ("사사해", 0), ("오오오", 0), ("육개장", 0), ("칠득이", 0), ("팔불출", 0), ("구구단", 0)]
    var countList = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBOutlet var labelCollection: [UILabel]!
    
    
    @IBOutlet var hateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        for i in 0...buttonCollection.count - 1 {
            buttonCollection[i].tag = i
            labelCollection[i].tag = i
            let now = UserDefaults.standard.integer(forKey: emotionTList[i].0)
            labelCollection[i].text = "\(emotionTList[i].0) \(now)"
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("메인 : ",#function)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("메인 : ",#function)
        hateLabel.text = "\(UserDefaults.standard.integer(forKey: "짜증나")) 만큼 싫어해"
    }
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        print("메인 : ",#function)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("메인 : ",#function)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("메인 : ",#function)
    }
    

    @IBAction func buttonClicked(_ sender: UIButton) {
        let tag = sender.tag
        let before = UserDefaults.standard.integer(forKey: "\(emotionTList[tag].0)")
        let now = before + 1
        UserDefaults.standard.set(now, forKey: "\(emotionTList[tag].0)")
        labelCollection[tag].text = "\(emotionTList[tag].0) \(now)"
    }
    
}

