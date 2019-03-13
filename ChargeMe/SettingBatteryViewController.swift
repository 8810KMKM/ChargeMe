//
//  SetTimingViewController.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/01/13.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import UIKit

class SettingBatteryViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var batteryLevelTextField: DoneTextField!
    
    var pickerView: UIPickerView = UIPickerView()
    let batteryLevels = [10, 20, 30, 40, 50, 60, 70, 80, 90]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        batteryLevelTextField.delegate = self
        pickerView.dataSource = self
        pickerView.showsSelectionIndicator = true
        
        
        self.batteryLevelTextField.inputView = pickerView
    }
    
    @objc func done() {
    }
    
    @objc func cancel() {
        self.batteryLevelTextField.text = ""
        self.batteryLevelTextField.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return batteryLevels.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(batteryLevels[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.batteryLevelTextField.text = String(batteryLevels[row])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // 良くない方法かも
        UserDefaults.alertBatteryLevel = Int(self.batteryLevelTextField.text!) ?? 30
        performSegue(withIdentifier: "SegueToMainVIew", sender: nil)
    }
}
