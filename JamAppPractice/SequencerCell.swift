//
//  SequencerCell.swift
//  JamAppPractice
//
//  Created by Patrick O'Leary on 3/31/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

class SequencerCell: UICollectionViewCell {
    @IBOutlet weak var lightView: UIView!
    @IBOutlet weak var pad: UIButton!
    
    @IBAction func padTapped(_ sender: Any) {
        if self.pad.alpha == 1{
            self.pad.alpha = 0.5
        } else {
            self.pad.alpha = 1
        }
    }
    
}
