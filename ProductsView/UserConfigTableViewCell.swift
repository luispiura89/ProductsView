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
                
                self.userProfileImage.transform = CGAffineTransform(translationX: -5, y: 0)
                let userLabelX = userNameLabel.center.x
                
                userNameLabel.center.x = userNameLabel.center.x + 10
                
                /*
                UIView.animateWithDuration(2, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                    self.userProfileImage.transform = CGAffineTransformIdentity
                    
                    }, completion: { (complete: Bool) in
                        
                })*/
                
                
                UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 100, options: .curveEaseOut, animations: {
                    
                    self.userProfileImage.transform = CGAffineTransform.identity
                
                    self.userNameLabel.center.x = userLabelX
                    
                    
                    }, completion: { (complete:Bool) in
                        
                })
                
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
