//
//  CurrentTime.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/03/05.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import Foundation


class CurrentTime{
    var timer: Timer?
    var currentTime: String?
    var df = DateFormatter()
    weak var delegate: MainViewController?
    
    init() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateCurrentTime),
            userInfo: nil,
            repeats: true)
    }
    
    @objc private func updateCurrentTime() {
        df.dateFormat = "HH:mm"
        df.timeZone = TimeZone.current
        let timezoneDate = df.string(from: Date())
        currentTime = timezoneDate
        delegate?.updateTime(currentTime!)
    }
    
}
