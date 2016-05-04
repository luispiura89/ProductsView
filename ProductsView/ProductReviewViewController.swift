//
//  ProductReviewViewController.swift
//  ProductsView
//
//  Created by Luis Francisco Piura Mejia on 3/5/16.
//  Copyright © 2016 Luis Francisco Piura Mejia. All rights reserved.
//

import UIKit

class ProductReviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var product: Product!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let productUW = product{
            productImageView.image = productUW.image
            productNameLabel.text = productUW.name
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showImage"{
            if let vc = segue.destinationViewController as? ImageScrollerViewController{
                vc.productImage = product.image
            }
        }
    }
    
    @IBAction func showImage(sender: AnyObject) {
        performSegueWithIdentifier("showImage", sender: self)
    }
    
    
    
    //MARK: - Table View Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("actionCell")!
        
        let actionLabel = indexPath.row == 0 ? "Rate" : indexPath.row == 1 ? "Buy" : indexPath.row == 2 ? "Write Review" : "Product Info"
        
        cell.textLabel?.text = actionLabel
        cell.textLabel?.font = UIFont.systemFontOfSize(14)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    

}
