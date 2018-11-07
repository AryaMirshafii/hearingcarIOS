//
//  mainScreen.swift
//  headingCar
//
//  Created by Arya Mirshafii on 2/4/18.
//  Copyright © 2018 georgiaTechEngineeringForInnovationGroup. All rights reserved.
//

import Foundation
import UIKit


class mainScreen: UIViewController {
    
    
    @IBOutlet weak var directionLabel: UITextView!
    @IBOutlet weak var speedLabel: UITextView!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    
    private var bluetoothConnector:BluetoothHandler!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
    
    
    @IBAction func settingsPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToSettings", sender: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    
}
