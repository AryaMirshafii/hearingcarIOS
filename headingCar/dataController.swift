//
//  dataController.swift
//  headingCar
//
//  Created by Arya Mirshafii on 3/7/18.
//  Copyright © 2018 georgiaTechEngineeringForInnovationGroup. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class dataController{
    private var user: [NSManagedObject] = []
   
    
    init() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        var managedContext:NSManagedObjectContext
        if #available(iOS 10.0, *) {
            managedContext = appDelegate.persistentContainer.viewContext
        } else {
            // Fallback on earlier versions
            managedContext = appDelegate.managedObjectContext
        }
        
        let userRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        //let timeRequest = NSFetchRequest<NSManagedObject>(entityName: "Time")
        do {
            user = try managedContext.fetch(userRequest)
            
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    public func saveLeftWarnings (leftWarnings: Int) {
        loadData()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        var managedContext:NSManagedObjectContext
        if #available(iOS 10.0, *) {
            managedContext = appDelegate.persistentContainer.viewContext
        } else {
            // Fallback on earlier versions
            managedContext = appDelegate.managedObjectContext
        }
        
        do {
            
            user.last?.setValue(leftWarnings, forKey: "leftWarnings")
            try managedContext.save()
            
        }catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
        
        
    }
    
    
    public func saveRightWarnings (rightWarnings: Int) {
        loadData()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        var managedContext:NSManagedObjectContext
        if #available(iOS 10.0, *) {
            managedContext = appDelegate.persistentContainer.viewContext
        } else {
            // Fallback on earlier versions
            managedContext = appDelegate.managedObjectContext
        }
        
        do {
            
            user.last?.setValue(rightWarnings, forKey: "rightWarnings")
            try managedContext.save()
            
        }catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
        
    }
    
    public func getRightWarnings() ->Int {
        self.loadData()
        if let righWarnings = user.last?.value(forKey: "rightWarnings") as? Int{
            return righWarnings
            
        }
        return 0
    }
    
    
    
    public func getLeftWarnings() ->Int {
        self.loadData()
        if let leftWarnings = user.last?.value(forKey: "leftWarnings") as? Int{
            return leftWarnings
            
        }
        return 0
    }
    
    
    private func loadData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        if #available(iOS 10.0, *) {
            let managedContext = appDelegate.persistentContainer.viewContext
            let userRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
            //let timeRequest = NSFetchRequest<NSManagedObject>(entityName: "Time")
            do {
                user = try managedContext.fetch(userRequest)
                
                
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        } else {
            // Fallback on earlier versions
            let managedContext = appDelegate.managedObjectContext
            let userRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
            //let timeRequest = NSFetchRequest<NSManagedObject>(entityName: "Time")
            do {
                user = try managedContext.fetch(userRequest)
                
                
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
        
        
    }
    
    public func calculateScore() -> Int{
        loadData()
        var leftWarnings = getLeftWarnings()
        var rightWarnings = getRightWarnings()
        return (leftWarnings + rightWarnings)/2
        
        
    }
    
    
    
    
    
    
    
}
