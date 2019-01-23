//
//  SettingSleepViewController.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/01/13.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import UIKit

class SettingSleepViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var sleepTextField: UITextField!
    
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
        // Do any additional setup after loading the view.
        
        //UIToolBarの設定
        toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.height-20.0)
        toolBar.barStyle = .blackTranslucent
        
        let toolBarBtn = UIBarButtonItem(title: "OK!", style: .done, target: self, action: #selector(done))
        
        toolBarBtn.tag = 1
        
        toolBar.items = [toolBarBtn]
        
        sleepTextField.inputAccessoryView = toolBar
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
        date_formatter.dateFormat = "hh:mm"
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
