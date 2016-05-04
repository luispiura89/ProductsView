//
//  Product.swift
//  ProductsView
//
//  Created by Luis Francisco Piura Mejia on 3/5/16.
//  Copyright © 2016 Luis Francisco Piura Mejia. All rights reserved.
//

import UIKit

enum ProductCategory{
    case Electronic
    case Home
    case Clothe
    case Toy
    case Service
    case Music
    case MusicalInstruments
}

class Product: NSObject {
    var name: String
    var summary: String
    var category: ProductCategory!
    var rate: Float
    var image: UIImage!
    var count: Int!
    var brand: String!
    var model: String!
    
    init(name: String, summary: String, category: ProductCategory,
         rate: Float, image: UIImage, count: Int, brand: String, model: String) {
        self.name = name
        self.summary = summary
        self.category = category
        self.rate = rate
        self.image = image
        self.count = count
        self.brand = brand
        self.model = model
    }
}
