//
//  SettingCell.swift
//  headingCar
//
//  Created by Arya Mirshafii on 11/7/18.
//  Copyright © 2018 georgiaTechEngineeringForInnovationGroup. All rights reserved.
//

import Foundation
import UIKit

class SettingCell: UITableViewCell{
    
    @IBOutlet weak var settingNameLabel: UILabel!
    @IBOutlet weak var enableSwitch: UISwitch!
    
    var title:String!
    var settingManager: SettingsManager!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        settingManager = SettingsManager()
        enableSwitch.addTarget(self, action: #selector(switchIsChanged), for: UIControlEvents.valueChanged)
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(defaultsChanged), name: UserDefaults.didChangeNotification , object: nil)
        

        
    }
    
    @objc func defaultsChanged(){
        if(settingManager.getTheme() != title){
            enableSwitch.isOn = false;
        }
    }
    
    
    @objc func switchIsChanged(mySwitch: UISwitch) {
        if mySwitch.isOn {
            print("Saving theme: " + title)
            settingManager.saveTheme(theme: title)
        } else {
            
        }
    }
}
