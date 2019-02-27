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
    let timingList = ["1", "5", "10", "15", "30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        timingTextField.delegate = self
        pickerView.dataSource = self
        pickerView.showsSelectionIndicator = true
        
        
        self.timingTextField.inputView = pickerView
    }
    
    @objc func done() {
        self.timingTextField.endEditing(true)
        
        UserDefaults.standard.set(self.timingTextField.text?.prefix(2), forKey: "alertTiming")
        performSegue(withIdentifier: "timingSegue", sender: nil)
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
        self.timingTextField.text = timingList[row] + "分前"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func textFieldDidEndEditing(_ textField: UITextField) {
        UserDefaults.standard.set(self.timingTextField.text?.prefix(2), forKey: "alertTiming")
        performSegue(withIdentifier: "timingSegue", sender: nil)
    }
}
