//
//  NewsCell.swift
//  tutbyNews
//
//  Created by Artyom Mazurkevich on 23/10/15.
//  Copyright © 2015 Artyom Mazurkevich. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet weak var pictureNews: UIImageView!
    @IBOutlet weak var nameNews: UILabel!
    @IBOutlet weak var dateNews: UILabel!
    @IBOutlet weak var textNews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
