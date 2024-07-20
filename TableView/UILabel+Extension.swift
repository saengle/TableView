//
//  UILabel+Extension.swift
//  TableView
//
//  Created by 쌩 on 5/27/24.
//

import UIKit

extension UILabel {
    
    func setPrimaryLabel() {
        self.font = .boldSystemFont(ofSize: 17)
        self.textAlignment = .left
        self.backgroundColor = .darkGray
        self.textColor = .white
        self.layer.borderColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1).cgColor
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1

        
    }
    
}


