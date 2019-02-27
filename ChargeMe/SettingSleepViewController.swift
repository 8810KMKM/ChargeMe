//
//  SettingSleepViewController.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/01/13.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import UIKit

class SettingSleepViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var sleepTextField: DoneTextField!
    
    var toolBar:UIToolbar!
    var myDatePicker: UIDatePicker!
    var sleepTime = ""
    var sleepMeridiem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIDatePickerの設定
        myDatePicker = UIDatePicker()
        myDatePicker.addTarget(self, action: #selector(changedDateEvent(sender:)), for: UIControl.Event.valueChanged)
        myDatePicker.datePickerMode = UIDatePicker.Mode.time
        sleepTextField.inputView = myDatePicker
        sleepTextField.delegate = self
        // Do any additional setup after loading the view.
        
    }
    
    @objc func done() {
        UserDefaults.standard.set(sleepTime, forKey: "sleepTime")
        UserDefaults.standard.set(sleepMeridiem, forKey: "sleepMeridian")
        performSegue(withIdentifier: "sleepSegue", sender: nil)
    }
    
    @objc func changedDateEvent(sender: Any){
        self.changeLabelDate(date: myDatePicker.date)
    }
    
    func changeLabelDate(date: Date) {
        
        sleepTextField.text = self.dateToString(date: date)
    }
    
    func dateToString(date: Date) -> String {
        
        let date_formatter: DateFormatter = DateFormatter()
        
        date_formatter.locale = Locale(identifier: "ja")
        date_formatter.timeStyle = .short
        //date_formatter.dateFormat = "hh:mm"
        
        let time = date_formatter.string(from: date)
        var a = "AM"
        date_formatter.dateFormat = "a"
        switch date_formatter.string(from: date) {
        case "午前":
            a = "AM"
        case "午後":
            a = "PM"
        default:
            break
        }
        
        sleepTime = time
        sleepMeridiem = a
        
        return time + " " + a
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        sleepTextField.text = dateToString(date: Date())
        return true
    }
    

    func textFieldDidEndEditing(_ textField: UITextField) {
        UserDefaults.standard.set(sleepTime, forKey: "sleepTime")
        UserDefaults.standard.set(sleepMeridiem, forKey: "sleepMeridian")
        performSegue(withIdentifier: "sleepSegue", sender: nil)
    }
}

