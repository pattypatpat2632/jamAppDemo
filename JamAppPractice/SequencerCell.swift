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
    weak var delegate: SequencerCellDelegate?
    var itemNum: Int?
    var cellIsOn = false
    
    @IBAction func padTapped(_ sender: Any) {
        if cellIsOn{
            self.pad.alpha = 0.5
            cellIsOn = false
        } else {
            self.pad.alpha = 1
            cellIsOn = true
        }
        print(itemNum!)
        print(cellIsOn)
        guard let itemNum = itemNum else {return}
        delegate?.buttonChange(key: itemNum, value: cellIsOn)
    }
}

protocol SequencerCellDelegate: class {
    func buttonChange(key: Int, value: Bool)
}
