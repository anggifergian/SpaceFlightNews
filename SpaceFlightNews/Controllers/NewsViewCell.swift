//
//  NewsViewCell.swift
//  SpaceFlightNews
//
//  Created by Anggi Fergian on 16/05/23.
//

import UIKit

class NewsViewCell: UITableViewCell {

    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var headingLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }

    private func setup() {
        thumbImage.layer.cornerRadius = 8
        thumbImage.layer.masksToBounds = true
    }
}
