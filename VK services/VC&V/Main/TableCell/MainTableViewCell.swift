//
//  MainTableViewCell.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let cellID = "MainTableViewCell"

    @IBOutlet weak var logoIV: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
