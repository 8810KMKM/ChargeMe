//
//  MainViewController.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/01/14.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var alertCount: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clock()
        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func clock() {
        let timer = Timer.scheduledTimer(
                        timeInterval: 1.0,
                        target: self,
                        selector: #selector(getNowTime(_:)),
                        userInfo: nil,
                        repeats: true)
        timer.fire()
    }
    
    @objc func getNowTime(_ sender: Timer) {
        
        let dateFormatter: DateFormatter = DateFormatter()
        let now = Date()
        
        dateFormatter.locale = Locale(identifier: "ja")
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        alertCount.text = dateFormatter.string(from: now)
    }
    
//    func countDown() -> Int {
//        let dateFormatter: DateFormatter = DateFormatter()
//        let now = Date()
//        
//        dateFormatter.locale = Locale(identifier: "ja")
//        dateFormatter.dateStyle = .none
//        dateFormatter.timeStyle = .medium
//        
//        return Calendar.current.dateComponents(
//            .hour, from: date, to: self).hour ?? 0
//    }

}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let userDefaults = UserDefaults.standard
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeCell", for: indexPath) as! TimeCollectionViewCell
            cell.updateCell(time: userDefaults.object(forKey: "sleepTime") as! String,
                            meridian: userDefaults.object(forKey: "sleepMeridian") as! String )
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "alertCell", for: indexPath) as! AlertCollectionViewCell
            cell.updateCell(timing: userDefaults.object(forKey: "alertTiming") as! String)
            return cell
            
        }
    }
}
