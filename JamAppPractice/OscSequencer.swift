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
        0: false,
        1: false,
        2: false,
        3: false,
        4: false,
        5: false,
        6: false,
        7: false,
        8: false,
        9: false,
        10: false,
        11: false,
        12: false,
        13: false,
        14: false,
        15: false
    ]
    
    let testDictionary = [
        0: true,
        1: false,
        2: true,
        3: false,
        4: true,
        5: false,
        6: true,
        7: false,
        8: true,
        9: false,
        10: true,
        11: false,
        12: true,
        13: false,
        14: true,
        15: false
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
        print("TRACK COUNT *************** \(sequencer.tracks.count)")
        sequencer.setLength(sequenceLength)
        generateSequence(fromDictionary: noteDictionary)
        
        AudioKit.output = midiNode
        AudioKit.start()
        midiNode.enableMIDI(midi.client, name: "midiNode midi in")
        sequencer.setTempo(240.0)
        sequencer.enableLooping()
        sequencer.play()
        print("Beat ********** \(sequencer.currentRelativePosition.beats)")
        
    }
    
    func changeNote(key: Int, value: Bool) {
        noteDictionary[key] = value
        generateSequence(fromDictionary: noteDictionary)
    }
    
    
   
    
    func changeTempo(_ newTempo: Double) {
        sequencer.setTempo(newTempo)
    }
    
    
    
}
