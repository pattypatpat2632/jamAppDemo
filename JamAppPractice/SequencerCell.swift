//
//  SequencerCell.swift
//  JamAppPractice
//
//  Created by Patrick O'Leary on 3/31/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

class SequencerCell: UICollectionViewCell, KeyboardViewDelegate {
    
    @IBOutlet weak var lightView: UIView!
    @IBOutlet weak var pad: UIButton!
    weak var delegate: SequencerCellDelegate?
    var itemNum: Int?
    var cellIsOn = false
    
    @IBAction func padTapped(_ sender: Any) {
        guard let itemNum = itemNum else {return}//TODO handle this error better
        if cellIsOn{
            self.pad.alpha = 0.5
            delegate?.buttonChange(key: itemNum, noteOn: !cellIsOn, noteValue: nil)
            cellIsOn = false
        } else {
            self.pad.alpha = 1
            getNote()
            delegate?.buttonChange(key: itemNum, noteOn: !cellIsOn, noteValue: nil)
            cellIsOn = true
        }
    }
    
    
    func getNote() {
        let screenBounds = UIScreen.main.bounds
        let keyboardFrame = CGRect(x: screenBounds.minX, y: screenBounds.minY, width: screenBounds.width,height: screenBounds.height/3)
        let keyboard = KeyboardView(frame: keyboardFrame)
        self.superview?.addSubview(keyboard)
    }
}

protocol SequencerCellDelegate: class {
    func buttonChange(key: Int, noteOn: Bool, noteValue: Int?)
}
