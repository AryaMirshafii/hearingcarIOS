//
//  SettingScreen.swift
//  headingCar
//
//  Created by Arya Mirshafii on 11/7/18.
//  Copyright © 2018 georgiaTechEngineeringForInnovationGroup. All rights reserved.
//

import Foundation
import UIKit

class SettingScreen: UITableViewController{
    
    var settingsArray = ["Dark", "ColorBlind","Night", "Rustic","Tropical" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "backgroundimage"))
        
        
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
        
        
    }
    

    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray.count + 1
        
        
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        if(indexPath.row  == 0){
            let cellIdentifier = "TitleCell"
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TitleCell  else {
                fatalError("The dequeued cell is not an instance of TitleCell.")
            }
            return cell;
        }else if(indexPath.row == settingsArray.count){
            let cellIdentifier = "OkCell"
            
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? OkCell  else {
                fatalError("The dequeued cell is not an instance of OkCell.")
            }
            return cell;
        }
        
         let cellIdentifier = "SettingCell"
         tableView.rowHeight = 100
        
         guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SettingCell  else {
            fatalError("The dequeued cell is not an instance of SettingCell.")
         }
        
        cell.settingNameLabel?.text = settingsArray[indexPath.row];
        
        cell.title = settingsArray[indexPath.row]
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.item >= settingsArray.count){
            
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 50
        }
        if(indexPath.row != settingsArray.count){
            return 85
        }
        return 140
    }
}
