//
//  ViewController.swift
//  ProductsView
//
//  Created by Luis Francisco Piura Mejia on 3/5/16.
//  Copyright © 2016 Luis Francisco Piura Mejia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var produtcs = [Product]()
    var selectedProduct: Product!
    
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        produtcs = loadProducts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - CollectionViewDelegate
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return produtcs.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProductCell", forIndexPath: indexPath) as! ProductCollectionViewCell
        
        let productItem = produtcs[indexPath.row]
        cell.product = productItem
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        selectedProduct = produtcs[indexPath.row]
        
        performSegueWithIdentifier("productDetail", sender: self)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad{
            let size = Int(self.view.frame.width / 3) - 20
            return CGSize(width: size, height: 180)
        }else{
            let size = Int(self.view.frame.width / 2) - 20
            return CGSize(width: size, height: 180)
        }
    }
    
    //MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "productDetail"{
            if let vc = segue.destinationViewController as? ProductReviewViewController{
                vc.product = selectedProduct
            }
        }
    }
    
    //MARK: - Load Data Functions
    
    func loadProducts() -> [Product]{
        var productsReturn = [Product]()
        
        var product = Product(name: "Macbook Pro", summary: "The new release of apple laptop computers, Ram: 16 GB", category: ProductCategory.Electronic, rate: 0.0, image: UIImage(named: "MacbookPro.jpg")!, count: 2, brand: "Apple", model: "MacBook Pro 2015", latitude: 14.063383, longitude: -87.186829)
        productsReturn.append(product)
        
        product = Product(name: "iPad4", summary: "The new release of apple tablet", category: ProductCategory.Electronic, rate: 0.0, image: UIImage(named: "iPad4.jpeg")!, count: 2, brand: "Apple", model: "iPad4", latitude: 14.063383, longitude: -87.186829)
        productsReturn.append(product)
        
        product = Product(name: "iPod Touch 6G", summary: "The new release of apple iPod", category: ProductCategory.Electronic, rate: 0.0, image: UIImage(named: "iPodTouch6g.jpeg")!, count: 2, brand: "Apple", model: "iPod Touch 6G", latitude: 14.063383, longitude: -87.186829)
        productsReturn.append(product)
        
        product = Product(name: "Gibson L5", summary: "Hollow body jazz guitar", category: ProductCategory.MusicalInstruments, rate: 0.0, image: UIImage(named: "GibsonL5.jpg")!, count: 2, brand: "Gibson", model: "L5", latitude: 14.063383, longitude: -87.186829)
        productsReturn.append(product)
        
        product = Product(name: "Sonor Bop", summary: "Mapple jazz drum kit", category: ProductCategory.MusicalInstruments, rate: 0.0, image: UIImage(named: "SonorBop.jpg")!, count: 2, brand: "Sonor", model: "Bop", latitude: 14.063383, longitude: -87.186829)
        productsReturn.append(product)
        
        product = Product(name: "Dangelico EX", summary: "Semi hollow body guitar, versatile for rock, jazz, blues and others", category: ProductCategory.MusicalInstruments, rate: 0.0, image: UIImage(named: "DangelicoEx.jpg")!, count: 2, brand: "Dangelico", model: "EX", latitude: 14.063383, longitude: -87.186829)
        productsReturn.append(product)
        
        product = Product(name: "Barcelona Jersey 16", summary: "The new jersey of FC Barcelona", category: ProductCategory.Clothe, rate: 0.0, image: UIImage(named: "Barcelona16.jpg")!, count: 2, brand: "Nike", model: "Barcelona 16 Kit", latitude: 14.063383, longitude: -87.186829)
        productsReturn.append(product)
        
        product = Product(name: "Washer", summary: "Washer", category: ProductCategory.Home, rate: 0.0, image: UIImage(named: "Washer.gif")!, count: 2, brand: "Washer", model: "Washer", latitude: 14.063383, longitude: -87.186829)
        productsReturn.append(product)
        
        product = Product(name: "Stove", summary: "Stove", category: ProductCategory.Home, rate: 0.0, image: UIImage(named: "Stove.jpg")!, count: 2, brand: "Stove", model: "Stove", latitude: 14.063383, longitude: -87.186829)
        productsReturn.append(product)
        
        product = Product(name: "By The Way", summary: "Fourth Studio Album by Red Hot Chilii Peppers", category: ProductCategory.Music, rate: 0.0, image: UIImage(named: "RcpByTheWay.jpg")!, count: 2, brand: "Sony", model: "Disc", latitude: 14.063383, longitude: -87.186829)
        productsReturn.append(product)
        
        product = Product(name: "Kind Of Blue", summary: "The Mile Davis most selled allbum", category: ProductCategory.Music, rate: 0.0, image: UIImage(named: "MilesDavisKindofBlue.jpg")!, count: 2, brand: "Sony", model: "Disc", latitude: 14.063383, longitude: -87.186829)
        productsReturn.append(product)
        
        
        
        return productsReturn
    }


}

