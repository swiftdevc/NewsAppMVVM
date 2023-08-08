//
//  NewsTableViewCell.swift
//  NewsAppMVVM
//
//  Created by Hasan PC on 8.08.2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var cellParagraph: UILabel!
    @IBOutlet weak var cellHeader: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
