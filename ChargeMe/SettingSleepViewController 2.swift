//
//  SettingSleepViewController.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/01/13.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import UIKit

class SettingSleepViewController: UIViewController {
    @IBOutlet weak var sleepTextField: UITextField!
    
    var toolBar:UIToolbar!
    var myDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIDatePickerの設定
        myDatePicker = UIDatePicker()
        myDatePicker.addTarget(self, action: Selector(("changeDateEvent")), for: UIControl.Event.valueChanged)
        myDatePicker.datePickerMode = UIDatePicker.Mode.date
        sleepTextField.inputView = myDatePicker
        // Do any additional setup after loading the view.
        
        
    }
    
    func changedDateEvent(sender:AnyObject?){
        var dateSelecter: UIDatePicker = sender as! UIDatePicker
        self.changeLabelDate(date: myDatePicker.date)
    }
    
    func changeLabelDate(date: Date) {
        sleepTextField.text = self.dateToString(date: date)
    }
    
    func dateToString(date: Date) -> String {
        let calender: Calendar = Calendar(identifier: <#T##Calendar.Identifier#>)
        let comps: DateComponents = calender.dateComponents(CFCalendarUnit.hour, , from: <#T##Date#>)
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
