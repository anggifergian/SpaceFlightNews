//
//  NewsViewCell.swift
//  SpaceFlightNews
//
//  Created by Anggi Fergian on 16/05/23.
//

import UIKit

protocol NewsViewCellDelegate: AnyObject {
    func NewsViewCellVisitTapped(_ cell: NewsViewCell)
}

class NewsViewCell: UITableViewCell {

    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var headingLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var visitBtn: UIButton!
    
    weak var delegate: NewsViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }

    private func setup() {
        thumbImage.layer.cornerRadius = 8
        thumbImage.layer.masksToBounds = true
    }
    
    @IBAction func visitBtnTapped(_ sender: Any) {
        delegate?.NewsViewCellVisitTapped(self)
    }
}
