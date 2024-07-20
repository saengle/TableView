//
//  UIViewController+Extension.swift
//  TableView
//
//  Created by 쌩 on 5/27/24.
//

import UIKit

extension UIViewController {
    
    func setBackground() {
        view.backgroundColor = .lightGray
        
    }
    
    func showAlert(title: String) {
        //1. alert 생성
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        //2. action 선언 필요시 handler 사용.
        let ok = UIAlertAction(title: "확인", style: .default)
        
        //3. alert에 action 등록
        alert.addAction(ok)
        //4. 띄우기
        present(alert, animated: true)
        
    }
    
}
