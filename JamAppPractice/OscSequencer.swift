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
