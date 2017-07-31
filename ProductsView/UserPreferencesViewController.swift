//
//  UserPreferencesViewController.swift
//  ProductsView
//
//  Created by Luis Francisco Piura Mejia on 12/5/16.
//  Copyright © 2016 Luis Francisco Piura Mejia. All rights reserved.
//

import UIKit

class UserPreferencesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //MARK: - TableView Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var identifier: String!
        var textLabel: String!
        
        switch indexPath.section {
        case 0:
            identifier = indexPath.row == 0 ? "profileCell" : indexPath.row == 1 ? "simpleCell" : "switchCell"
        
            textLabel = indexPath.row == 0 ? "Luis Piura" : indexPath.row == 1 ? "Privacy" : "Recieve Notifications"
        case 1:
            identifier = indexPath.row == 0 ? "simpleCell" : "simpleCell"
            
            textLabel = indexPath.row == 0 ? "About Products View" : "Contact Us"
        default:
            identifier = ""
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! UserConfigTableViewCell
        
        cell.labelText = textLabel
        cell.cellType = identifier
        
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0{
            return 124.0
        }
        
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { return 0.1 }
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView( _ tableView : UITableView,  titleForHeaderInSection section: Int)->String? {
        switch(section) {
        case 1:
            return "About"
        default :
            return ""
        }
    }

}
