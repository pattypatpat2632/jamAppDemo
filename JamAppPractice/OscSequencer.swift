//
//  Sequencer.swift
//  JamAppPractice
//
//  Created by Patrick O'Leary on 3/22/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import Foundation
import AudioKit

class OscSequencer {
    
    let oscBank = AKOscillatorBank()
    let sequencer = AKSequencer()
    let midi = AKMIDI()
    var verb: AKReverb?
    let scale1: [Int] = [0, 2, 4, 7, 9]
    let scale2: [Int] = [0, 3, 5, 7, 10]
    let sequenceLength = AKDuration(beats: 16.0)
    
    var noteDictionary = [
        0: (false, 60),
        1: (false, 60),
        2: (false, 60),
        3: (false, 60),
        4: (false, 60),
        5: (false, 60),
        6: (false, 60),
        7: (false, 60),
        8: (false, 60),
        9: (false, 60),
        10: (false, 60),
        11: (false, 60),
        12: (false, 60),
        13: (false, 60),
        14: (false, 60),
        15: (false, 60)
    ]
    
    init() {
        
    }
    
    func setUpSequencer() {
        let midiNode = AKMIDINode(node: oscBank)

        oscBank.attackDuration = 0.1
        oscBank.decayDuration = 0.1
        oscBank.sustainLevel = 0.1
        oscBank.releaseDuration = 0.5
        verb = AKReverb(midiNode)
        
        _ = sequencer.newTrack()
        sequencer.setLength(sequenceLength)
        generateSequence(fromDictionary: noteDictionary)
        
        AudioKit.output = verb
        AudioKit.start()
        midiNode.enableMIDI(midi.client, name: "midiNode midi in")
        sequencer.setTempo(360.0)
        sequencer.enableLooping()
        sequencer.play()
    }
    
    func changeNote(key: Int, noteOn: Bool, noteValue: Int) {
        noteDictionary[key] = (noteOn, noteValue)
        generateSequence(fromDictionary: noteDictionary)
    }

    func changeTempo(_ newTempo: Double) {
        sequencer.setTempo(newTempo)
    }
    
    func generateSequence(fromDictionary dictionary: [Int: (Bool, Int)]) {
        print("SEQUENCE GENERATED")
        sequencer.tracks[0].clear()
        let numberOfSteps = 15
        for i in 0 ... numberOfSteps {
            if dictionary[i]?.0 == true {
                if let noteNum = dictionary[i]?.1 {
                    sequencer.tracks[0].add(noteNumber: MIDINoteNumber(noteNum), velocity: 127, position: AKDuration(beats: Double(i)), duration: AKDuration(beats: 1.0))
                }
            }
        }
        sequencer.setLength(sequenceLength)
    }
    
    
    
}
