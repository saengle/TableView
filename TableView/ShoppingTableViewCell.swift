//
//  ShoppingCellTableViewCell.swift
//  TableView
//
//  Created by 쌩 on 5/24/24.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet var checkButton: UIButton!
    @IBOutlet var starButton: UIButton!
    @IBOutlet var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
