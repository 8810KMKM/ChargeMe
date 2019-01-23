//
//  TimeCollectionViewCell.swift
//  ChargeMe
//
//  Created by 大隈隼 on 2019/01/14.
//  Copyright © 2019 大隈隼. All rights reserved.
//

import UIKit

class TimeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var meridianLabel: UILabel!
    
    func updateCell(time: String, meridian: String) {
        timeLabel.text = time
        meridianLabel.text = meridian
    }
}
