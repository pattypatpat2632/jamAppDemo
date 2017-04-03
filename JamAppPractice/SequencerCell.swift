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
            cellIsOn = false
            self.pad.alpha = 0.5
            delegate?.buttonChange(key: itemNum, noteOn: false, noteValue: nil)
        } else {
            cellIsOn = true
            self.pad.alpha = 1
            showKeyboard()
        }
    }
    
    func showKeyboard() {
        let screenBounds = UIScreen.main.bounds
        let keyboardFrame = CGRect(x: screenBounds.minX, y: screenBounds.minY, width: screenBounds.width,height: screenBounds.height/3)
        let keyboard = KeyboardView(frame: keyboardFrame)
        keyboard.delegate = self
        self.superview?.addSubview(keyboard)
        //TODO set up observer for a return from the keyboard, and when it returns, run completion with the new value
    }
    
    func noteOn(noteValue: Int) {
        print("KEYBOARD SEND NOTE ON MESSAGE")
        guard let itemNum = itemNum else {return} //TODO handle this error better
        self.delegate?.buttonChange(key: itemNum, noteOn: self.cellIsOn, noteValue: noteValue)
    }
}

protocol SequencerCellDelegate: class {
    func buttonChange(key: Int, noteOn: Bool, noteValue: Int?)
}
