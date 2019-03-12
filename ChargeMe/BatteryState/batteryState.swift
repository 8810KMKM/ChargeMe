//
//  butteryState.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/03/12.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import UIKit



class BatteryState {
    var chargeTimer: Timer?
    
    init() {
        UIDevice.current.isBatteryMonitoringEnabled = true
//        runTimer()
    }
    
    func runTimer() {
        chargeTimer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateColor),
            userInfo: nil,
            repeats: true)
    }
    
    @objc private func updateColor() {
        print("hoge")
    }
    
    func isCharging()-> Bool {
        let currentBatteryState = UIDevice.current.batteryState
        if currentBatteryState == UIDevice.BatteryState.charging {
            return true
        } else {
            return false
        }
    }
    
    func getBatteryState()-> String {
        
        switch UIDevice.current.batteryState {
        case UIDevice.BatteryState.full:
            return "full"
        case UIDevice.BatteryState.charging:
            return "charging"
        case UIDevice.BatteryState.unplugged:
            return "unplugged"
        case UIDevice.BatteryState.unknown:
            return  "unknown"
        default:
            return ""
        }
    }
}
