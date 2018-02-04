//
//  warningScreen.swift
//  headingCar
//
//  Created by Arya Mirshafii on 2/3/18.
//  Copyright © 2018 georgiaTechEngineeringForInnovationGroup. All rights reserved.
//

import Foundation
import UIKit

class warningScreen: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
   
    @IBAction func goToNext(_ sender: Any) {
        performSegue(withIdentifier: "goToMain", sender: self)
    }
    
    
}
