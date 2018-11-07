//
//  SettingsManager.swift
//  headingCar
//
//  Created by Arya Mirshafii on 11/7/18.
//  Copyright © 2018 georgiaTechEngineeringForInnovationGroup. All rights reserved.
//

import Foundation

import CoreData
import UIKit
class SettingsManager{
    var managedObjectContext: NSManagedObjectContext?
    //stores the keys for settings values
    struct defaultsKeys {
        static let theme = "default"
        
        
        
    }
    
    func saveTheme(theme: String) {
        let defaults = UserDefaults.standard
        defaults.set(theme, forKey: defaultsKeys.theme)
        
    }
    
    func getTheme() -> String {
        let defaults = UserDefaults.standard
        if let theme = defaults.string(forKey: defaultsKeys.theme) {
            // Some String Value
            return theme
        }
        return "default"
    }
}
