//
//  BluetoothHandler
//  headingCar
//
//  Created by Arya Mirshafii on 3/7/18.
//  Copyright © 2018 georgiaTechEngineeringForInnovationGroup. All rights reserved.
//

import UIKit
import RxBluetoothKit
import RxSwift
import CoreBluetooth


extension Data{
    func toString() -> String
    {
        return String(data: self, encoding: .utf8)!
    }
}
class BluetoothHandler : NSObject{
    private var isConnected:Bool = false;
    private var score:Int = 0;
    private var dataManager  = dataController();
    private var leftWarnings = 0;
    private var rightwarnings = 0;
    
    
    private var UUID = "0000FFE0-0000-1000-8000-00805F9B34FB"
    private var charID = "0000FFE1-0000-1000-8000-00805F9B34FB"
    
    
    
    private var isScanInProgress = false
    private var scheduler: ConcurrentDispatchQueueScheduler!
    private var manager:CentralManager!
    private var scanningDisposable: Disposable?
    fileprivate var peripheralsArray: [ScannedPeripheral] = []
    private var myPeripheral: Peripheral!
    private var serviceId:CBUUID!
    
    private var characteristicId:CBUUID!
    private var timerQueue:DispatchQueue!
    
    
    override init() {
        super.init()
        self.timerQueue = DispatchQueue(label: "timer queue")
        self.scheduler = ConcurrentDispatchQueueScheduler(queue: timerQueue)
        self.serviceId = CBUUID(string: UUID)
        self.characteristicId = CBUUID(string: charID)
        self.manager = CentralManager(queue: .main)
        
        var timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.startReading), userInfo: nil, repeats: false)
        
        getData()
        
        
        
        
    }
    
    
    
    /**
     Scans for the ble device finds the requested characteristic and reads the data being transmitted
     
     */
    @objc private func startReading(){
        print("Scanning....")
        
        
        if(manager == nil){
            print("The manager is nil. Returning")
            return
        }else if(manager.state != .poweredOn){
            print("The manager is not powered on")
            return
        }
        
        print("Ble state is1 " + String(describing: manager.state))
        
        manager.scanForPeripherals(withServices: [serviceId]).take(1)
            .flatMap { $0.peripheral.establishConnection() }
            .flatMap { $0.discoverServices([self.serviceId]) }.asObservable()
            .flatMap { Observable.from($0) }
            .flatMap { $0.discoverCharacteristics([self.characteristicId])}.asObservable()
            .flatMap { Observable.from($0) }
            .flatMap { $0.observeValueUpdateAndSetNotification() }
            .subscribe(onNext: {
                let data = $0.value
                //print("Data is " + (data?.toString())!)
                self.processData(data: (data?.toString())!)
            })
        
        
        
        
        
    }
    
    
    
    
    
    /**
     @Param data: the data to process
     */
    private func processData(data: String){
        print("The data being processed is " + data)
        //Process data here
        
    }
    
    
    
    
    
    
    /**
     Pulls the saved data and stores it into 3 variables.
     */
    private func getData(){
        rightwarnings = dataManager.getRightWarnings()
        leftWarnings = dataManager.getLeftWarnings()
        score = dataManager.calculateScore()
    }
    
}

