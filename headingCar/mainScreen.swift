//
//  mainScreen.swift
//  headingCar
//
//  Created by Arya Mirshafii on 2/4/18.
//  Copyright © 2018 georgiaTechEngineeringForInnovationGroup. All rights reserved.
//

import Foundation
import UIKit
import UICircularProgressRing

class mainScreen: UIViewController {
    
    
    @IBOutlet weak var batteryView: UICircularProgressRing!
    private var bluetoothConnector:BluetoothHandler!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        batteryView.layer.cornerRadius = batteryView.frame.height/2
        batteryView.clipsToBounds = true
        
        bluetoothConnector = BluetoothHandler()
        
        
        
        
        
    }
    
    
   
    @IBAction func leftHornTrigger(_ sender: Any) {
        performSegue(withIdentifier: "leftHornWarning", sender: nil)
        
    }
    
    @IBAction func rightHornTrigger(_ sender: Any) {
        performSegue(withIdentifier: "rightHornWarning", sender: nil)
        
    }
    
    
    @IBAction func leftSirenTrigger(_ sender: Any) {
         performSegue(withIdentifier: "leftSiren", sender: nil)
    }
    
    
    @IBAction func rightSirenWarning(_ sender: Any) {
        performSegue(withIdentifier: "rightSiren", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
}
