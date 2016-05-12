//
//  UserConfigTableViewCell.swift
//  ProductsView
//
//  Created by Luis Francisco Piura Mejia on 12/5/16.
//  Copyright © 2016 Luis Francisco Piura Mejia. All rights reserved.
//

import UIKit

class UserConfigTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var switchCellLabel: UILabel!
    @IBOutlet weak var simpleCellLabel: UILabel!
    @IBOutlet weak var userProfileImage: UIImageView!
    var labelText: String!
    var cellType: String!{
        didSet{
            switch cellType {
            case "profileCell":
                userProfileImage.layer.cornerRadius = userProfileImage.frame.width / 2
                userNameLabel.text = labelText
            case "simpleCell":
                simpleCellLabel.text = labelText
            case "switchCell":
                switchCellLabel.text = labelText
            default:
                /*  Nada  */
                print("")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
