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
    static let alertTiming =  "alertTiming"
}

extension UserDefaults {
    static var sleepTime: String {
        get { return self.standard.string(forKey: UserDefaultsKeys.sleepTime) ?? "" }
        set { self.standard.set(newValue, forKey: UserDefaultsKeys.sleepTime) }
    }
    
    static var alertTiming: String {
        get {
            print(self.standard.string(forKey: UserDefaultsKeys.alertTiming)?.characters.count)
            if self.standard.string(forKey: UserDefaultsKeys.alertTiming) == "1" || self.standard.string(forKey: UserDefaultsKeys.alertTiming) == "5"  {
                return "0" + (self.standard.string(forKey: UserDefaultsKeys.alertTiming) ?? "")
            }
            return self.standard.string(forKey: UserDefaultsKeys.alertTiming) ?? ""
            
        }
        set { self.standard.set(newValue, forKey: UserDefaultsKeys.alertTiming) }
    }
    
}

