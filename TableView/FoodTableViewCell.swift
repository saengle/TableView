//
//  FoodTableViewCell.swift
//  TableView
//
//  Created by 쌩 on 5/27/24.
//

import UIKit

import Kingfisher

class FoodTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var starButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureLayout() {
        self.titleLabel.setPrimaryLabel()
        self.subTitleLabel.font = .systemFont(ofSize: 13)
        self.subTitleLabel.textColor = .darkGray
        self.descriptionLabel.font = .boldSystemFont(ofSize: 20)
        self.descriptionLabel.textColor = .lightGray
        self.mainImageView.backgroundColor = .gray
    }
    
    func configureCell(data: Restaurant) {
        self.titleLabel.text = "\(data.name) | \(data.category)"
        self.subTitleLabel.text = data.address
        self.descriptionLabel.text = data.price.formatted() + "원"
        let url = URL(string: data.image)
        self.mainImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star"))
        mainImageView.contentMode = .scaleToFill
    }
}
