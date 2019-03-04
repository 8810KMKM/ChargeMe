//
//  NotificationCenter.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/03/04.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import Foundation
import UserNotifications

func PermitNotification() {
    if #available(iOS 10.0, *) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge, .sound, .alert]) { (granted, error) in
            if error != nil {
                return
            }
            
            if granted {
                print("通知許可")
            } else {
                print("通知拒否")
            }
        }
    }
}

func setUpNotification() {
    PermitNotification()
    var notificationTime = DateComponents()
    let trigger: UNNotificationTrigger
    
    notificationTime.hour = 23
    notificationTime.minute = 45
    trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: true)
    
    let content = UNMutableNotificationContent()
    
    content.title = "ChargeMe"
    content.body = "デバイスを充電して下さい!!"
    content.sound = UNNotificationSound.default
    
    let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    
//    trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
    
}
