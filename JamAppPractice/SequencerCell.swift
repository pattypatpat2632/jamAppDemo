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
        guard let itemNum = itemNum else {return}//TODO handle this error better
        if cellIsOn{
            cellIsOn = false

            self.pad.alpha = 0.5
            delegate?.buttonChange(key: itemNum, noteOn: cellIsOn, noteValue: nil)
        } else {
            cellIsOn = true

            self.pad.alpha = 1
            getNote(completion: { (noteValue) in
                self.delegate?.buttonChange(key: itemNum, noteOn: self.cellIsOn, noteValue: noteValue)
            })
            
        }
    }
    
    
    func getNote(completion: @escaping (Int) -> Void) {
        let screenBounds = UIScreen.main.bounds
        let keyboardFrame = CGRect(x: screenBounds.minX, y: screenBounds.minY, width: screenBounds.width,height: screenBounds.height/3)
        let keyboard = KeyboardView(frame: keyboardFrame)
        self.superview?.addSubview(keyboard)
       NotificationCenter.default.addObserver(forName: NSNotification.Name("keyPressedNotification"), object: nil, queue: nil) { (notification) in
            print(notification.object)
            let note = notification.object as! Int //TODO handle ! better
            completion(note)
        }
        //TODO set up observer for a return from the keyboard, and when it returns, run completion with the new value
    }
}

protocol SequencerCellDelegate: class {
    func buttonChange(key: Int, noteOn: Bool, noteValue: Int?)
}
