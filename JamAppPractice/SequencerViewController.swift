//
//  ViewController.swift
//  JamAppPractice
//
//  Created by Patrick O'Leary on 3/22/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit
import Foundation
import AudioKit


class SequencerViewController: UIViewController, AKMIDIListener {
    
    let oscSequencer = OscSequencer()
    @IBOutlet weak var tempoLabel: UILabel!
    @IBOutlet weak var tempoSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        var midi = AKMIDI()
        midi.openInput()
        midi.addListener(self)
        
        oscSequencer.setUpSequencer()
        
        
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        tempoLabel.text = String(tempoSlider.value)
        oscSequencer.changeTempo(Double(tempoSlider.value))
    }

    func receivedMIDINoteOn(noteNumber: MIDINoteNumber, velocity: MIDIVelocity, channel: MIDIChannel) {
        print("HEY! NOTE")
    }
    
}

