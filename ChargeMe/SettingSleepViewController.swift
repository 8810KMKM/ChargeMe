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
        myDatePicker.locale = Locale(identifier: "ja")
        sleepTextField.inputView = myDatePicker
        sleepTextField.delegate = self
        sleepTime = self.dateToString(date: myDatePicker.date)
        sleepTextField.text = sleepTime
        UserDefaults.sleepTime = sleepTime
    }
    
    @objc func done() {
    }
    
    @objc func changedDateEvent(sender: Any) {
        print(myDatePicker.date)
        let newTime = self.dateToString(date: myDatePicker.date)
        self.sleepTime = newTime
        sleepTextField.text = newTime
    }
    
    func dateToString(date: Date) -> String {
        
        let dateFormatter: DateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ja")
        dateFormatter.timeStyle = .short
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        sleepTextField.text = dateToString(date: Date())
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        UserDefaults.sleepTime = self.sleepTime
        UserDefaults.sleepTimeByDate = self.myDatePicker.date
    }
}
