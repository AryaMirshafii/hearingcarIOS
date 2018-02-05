//
//  leftWarningView.swift
//  headingCar
//
//  Created by Arya Mirshafii on 2/5/18.
//  Copyright © 2018 georgiaTechEngineeringForInnovationGroup. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

class leftWarningView: UIViewController {
    private var timer:Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(alarmSequence), userInfo: nil, repeats: true)
    }
    private var timerCounter = 0
    @objc func alarmSequence(){
        if(timerCounter == 16){
            self.timer.invalidate()
            self.dismiss(animated: false, completion: nil)
        } else {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            timerCounter += 1
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
