//
//  UserDefaults+Extension.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/03/04.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import UIKit

private struct UserDefaultsKeys {
    static let sleepTime = "sleepTime"
    static let alertBatteryLevel =  "alertBatteryLevel"
    static let sleepTimeByDate = "sleepTimeByDate"
}

extension UserDefaults {
    static var sleepTime: String {
        get { return self.standard.string(forKey: UserDefaultsKeys.sleepTime) ?? "" }
        set { self.standard.set(newValue, forKey: UserDefaultsKeys.sleepTime) }
    }
    
    static var alertBatteryLevel: Int {
        get { return self.standard.integer(forKey: UserDefaultsKeys.alertBatteryLevel) }
        set { self.standard.set(newValue, forKey: UserDefaultsKeys.alertBatteryLevel) }
    }
    
    static var sleepTimeByDate: Date {
        get { return self.standard.object(forKey: UserDefaultsKeys.sleepTimeByDate) as! Date }
        set { self.standard.set(newValue, forKey: UserDefaultsKeys.sleepTimeByDate) }
    }
    
}

