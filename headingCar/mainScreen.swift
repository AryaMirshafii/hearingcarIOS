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
    
    
    @IBOutlet weak var batteryView: UICircularProgressRingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        batteryView.layer.cornerRadius = batteryView.frame.height/2
        batteryView.clipsToBounds = true
        
        
        
        
        
    }
    
    
    @IBAction func triggerLeftWarning(_ sender: Any) {
        performSegue(withIdentifier: "leftHornWarning", sender: nil)
    }
    @IBAction func triggerRightWarning(_ sender: Any) {
        performSegue(withIdentifier: "rightHornWarning", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
}
