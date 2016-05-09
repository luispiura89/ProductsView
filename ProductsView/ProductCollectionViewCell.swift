//
//  ProductCollectionViewCell.swift
//  ProductsView
//
//  Created by Luis Francisco Piura Mejia on 3/5/16.
//  Copyright © 2016 Luis Francisco Piura Mejia. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var product: Product!{
        didSet{
            //self.layer.borderWidth = 0.3
            //self.layer.borderColor = UIColor.lightGrayColor().CGColor
            //self.layer.cornerRadius = 5
            /*productImageView.layer.borderWidth = 0.5
            productImageView.layer.borderColor = UIColor.lightGrayColor().CGColor
            
            nameLabel.layer.borderWidth = 0.5
            nameLabel.layer.borderColor = UIColor.lightGrayColor().CGColor
            
            summaryLabel.layer.borderWidth = 0.5
            summaryLabel.layer.borderColor = UIColor.lightGrayColor().CGColor*/
            
            productImageView.image = product.image
            nameLabel.text = product.name
            summaryLabel.text = product.summary
        }
    }
}
