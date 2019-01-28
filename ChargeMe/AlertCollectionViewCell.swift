//
//  AlertCollectionViewCell.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/01/14.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import UIKit

class AlertCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var timingLabel: UILabel!
    
    func updateCell(timing: String) {
        timingLabel.text = timing
    }
    
}
