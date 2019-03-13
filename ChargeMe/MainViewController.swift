//
//  MainViewController.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/01/14.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import UIKit
import UserNotifications

class MainViewController: UIViewController {

    @IBOutlet weak var alertCount: UILabel!
    @IBOutlet weak var mainBar: UIView!
    
    
    var currentTime = CurrentTime()
    let alarm = Alarm()
    var chargeTimer: Timer?
    
    override func viewDidLoad() {
        setUpNotification()
        super.viewDidLoad()
        
        alarm.selectedAlertTime = UserDefaults.sleepTimeByDate
        alarm.runTimer()
        runChargeTimer()
        
    }
    
    func runChargeTimer() {
        chargeTimer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateChargeTimer),
            userInfo: nil,
            repeats: true)
    }
    
    @objc private func updateChargeTimer() {
        alertCount.text = String(Int((UIDevice.current.batteryLevel + 0.005) * 100)) + "%"
        alarm.batteryState.updateBsBar(mainView: mainBar)
    }
    
    func updateTime(_ time:String) { }
    
}


extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeCell", for: indexPath) as! TimeCollectionViewCell
            cell.updateCell(time: UserDefaults.sleepTime,
                            meridian: "")
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "alertCell", for: indexPath) as! AlertCollectionViewCell
            print(UserDefaults.alertBatteryLevel)
            cell.updateCell(alertBatteryLevel: String(UserDefaults.alertBatteryLevel))
            return cell
            
        }
    }
}
