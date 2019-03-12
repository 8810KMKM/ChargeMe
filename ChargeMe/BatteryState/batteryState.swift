//
//  butteryState.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/03/12.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import UIKit

class BatteryState {
    func getBatteryState()-> String {
        print(UIDevice.current.batteryState)
        
        var text = ""
        
        switch UIDevice.current.batteryState {
        case UIDevice.BatteryState.full:
            text =  "full"
            break
        case UIDevice.BatteryState.charging:
            text = "charging"
            break
        case UIDevice.BatteryState.unplugged:
            text = "unplugged"
            break
        case UIDevice.BatteryState.unknown:
            text = "unknown"
            break
        default:
            break
        }
        return text
    }
}
