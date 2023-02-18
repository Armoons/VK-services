//
//  MainTableViewCell.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    // MARK: - Static Properties
    
    static let cellID = "MainTableViewCell"
    
    // MARK: - XIB Properties

    @IBOutlet weak var logoIV: UIImageView!
    @IBOutlet weak var name: UILabel!
}
