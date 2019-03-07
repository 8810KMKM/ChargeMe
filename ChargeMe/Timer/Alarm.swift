//
//  Alarm.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/03/05.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import Foundation
import AVFoundation

class Alarm{
    var selectedAlertTime: Date?
    var audioPlayer: AVAudioPlayer?
    var chargeTimer: Timer?
    var seconds = 0
    
    func runTimer() {
        seconds = calculateInterval(alertTime: selectedAlertTime!)
        chargeTimer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true)
    }
    
    @objc private func updateTimer() {
        if seconds != 0 {
            print(seconds)
            seconds -= 1
        } else {
            chargeTimer?.invalidate()
            chargeTimer = nil
            
            let soundFilePath = Bundle.main.path(forResource: "03 ABOAB", ofType: "m4a")!
            let sound:URL = URL(fileURLWithPath: soundFilePath)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint: nil)
            } catch {
                print("Cloud not load file")
            }
            audioPlayer?.play()
            Thread.sleep(forTimeInterval: 30)
            audioPlayer?.stop()
        }
    }
    
    private func calculateInterval(alertTime: Date)-> Int {
        var interval = Int(alertTime.timeIntervalSinceNow)
        
        if interval < 0 {
            interval = 86400 - (0 - interval)
        }
        
        let calender = Calendar.current
        let seconds = calender.component(.second, from: alertTime)
        return interval - seconds
    }
    
    func stopTimer() {
        if chargeTimer != nil {
            chargeTimer?.invalidate()
            chargeTimer = nil
        } else {
            audioPlayer?.stop()
        }
    }
}
