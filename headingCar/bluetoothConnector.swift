//
//  bluetoothConnector.swift
//  headingCar
//
//  Created by Arya Mirshafii on 3/7/18.
//  Copyright © 2018 georgiaTechEngineeringForInnovationGroup. All rights reserved.
//

import UIKit
import RxBluetoothKit
import RxSwift
import CoreBluetooth
class bluetoothConnector{
    private var isConnected:Bool = false;
    private var score:Int = 0;
    private var dataManager  = dataController();
    private var leftWarnings = 0;
    private var rightwarnings = 0;
    
    
    
    private var isScanInProgress = false
    private var scheduler: ConcurrentDispatchQueueScheduler!
    private let manager = BluetoothManager(queue: .main)
    private var scanningDisposable: Disposable?
    fileprivate var peripheralsArray: [ScannedPeripheral] = []
    
    init() {
        getData()
        let timerQueue = DispatchQueue(label: "timer queue")
        scheduler = ConcurrentDispatchQueueScheduler(queue: timerQueue)
       

        
        
    }
    
    private func stopScanning() {
        scanningDisposable?.dispose()
        isScanInProgress = false
        
    }
    
    
    private func startScanning() {
        isScanInProgress = true
        
        scanningDisposable = manager.rx_state
            .timeout(4.0, scheduler: scheduler)
            .take(1)
            .flatMap { _ in self.manager.scanForPeripherals(withServices: nil, options: nil) }
            .subscribeOn(MainScheduler.instance)
            .subscribe(onNext: {
                self.addNewScannedPeripheral($0)
            }, onError: { _ in
            })
    }
    
    
    private func addNewScannedPeripheral(_ peripheral: ScannedPeripheral) {
        let mapped = peripheralsArray.map { $0.peripheral }
        
        //update this to check for name check id if it equals
        if let indx = mapped.index(of: peripheral.peripheral) {
            peripheralsArray[indx] = peripheral
        } else {
            peripheralsArray.append(peripheral)
        }
        
    }
    
    
    
    
    
    
    public func checkConnection()->Bool{
        return false;
    }
    
    private func connect(){
        
    }
    
    public func getData(){
        rightwarnings = dataManager.getRightWarnings()
        leftWarnings = dataManager.getLeftWarnings()
        score = dataManager.calculateScore()
    }
    
}
