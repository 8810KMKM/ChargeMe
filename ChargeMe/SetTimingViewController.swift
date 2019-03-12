//
//  SetTimingViewController.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/01/13.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import UIKit

class SetTimingViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var timingTextField: DoneTextField!
    
    var pickerView: UIPickerView = UIPickerView()
    let timingList = ["--", "1", "5", "10", "15", "30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        timingTextField.delegate = self
        pickerView.dataSource = self
        pickerView.showsSelectionIndicator = true
        
        
        self.timingTextField.inputView = pickerView
    }
    
    @objc func done() {
    }
    
    @objc func cancel() {
        self.timingTextField.text = ""
        self.timingTextField.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timingList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return timingList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.timingTextField.text = timingList[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        UserDefaults.alertTiming = self.timingTextField.text!
        performSegue(withIdentifier: "timingSegue", sender: nil)
    }
}
