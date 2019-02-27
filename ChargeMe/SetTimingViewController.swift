//
//  SetTimingViewController.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/01/13.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import UIKit

class SetTimingViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var timing: UITextField!
    
    var pickerView: UIPickerView = UIPickerView()
    let timingList = ["1", "5", "10", "15", "30"]
    
    override func viewDidLoad() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.showsSelectionIndicator = true
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let toolBarBtn = UIBarButtonItem(title: "OK!", style: .done, target: self, action: #selector(done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        toolbar.setItems([toolBarBtn], animated: true)
        
        self.timing.inputView = pickerView
        self.timing.inputAccessoryView = toolbar
    }
    
    @objc func done() {
        self.timing.endEditing(true)
        
        UserDefaults.standard.set(self.timing.text?.prefix(2), forKey: "alertTiming")
        performSegue(withIdentifier: "timingSegue", sender: nil)
    }
    
    @objc func cancel() {
        self.timing.text = ""
        self.timing.endEditing(true)
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
        self.timing.text = timingList[row] + "分前"
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

}
