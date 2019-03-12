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
    
    func isCharging()-> Bool {
        let currentBatteryState = UIDevice.current.batteryState
        if currentBatteryState == UIDevice.BatteryState.charging {
            return true
        } else {
            return false
        }
    }
}
