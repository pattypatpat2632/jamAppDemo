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
    let testDictionary = [
        0: true,
        1: true,
        2: true,
        3: true,
        4: false,
        5: true,
        6: false,
        7: true,
        8: false,
        9: true,
        10: false,
        11: true,
        12: false,
        13: true,
        14: false,
        15: true,
    ]
    
    init() {
        
    }
    
    func setUpSequencer() {
        let midiNode = AKMIDINode(node: oscBank)

        oscBank.attackDuration = 0.1
        oscBank.decayDuration = 0.1
        oscBank.sustainLevel = 0.1
        oscBank.releaseDuration = 0.3
        verb = AKReverb(midiNode)
        
        _ = sequencer.newTrack()
        print("TRACK COUNT *************** \(sequencer.tracks.count)")
        sequencer.setLength(sequenceLength)
        generateSequence(fromDictionary: testDictionary)
        
        AudioKit.output = midiNode
        AudioKit.start()
        midiNode.enableMIDI(midi.client, name: "midiNode midi in")
        sequencer.setTempo(120.0)
        sequencer.enableLooping()
        sequencer.play()
        print("Beat ********** \(sequencer.currentRelativePosition.beats)")
        
    }
    
    func generateRandomSequence(_ stepSize: Float = 1/8, minor: Bool = false, clear: Bool = true) {
        if (clear) { sequencer.tracks[0].clear() }
        sequencer.setLength(sequenceLength)
        let numberOfSteps = Int(Float(sequenceLength.beats)/stepSize)
        print("Number of steps *****\(numberOfSteps)")
        //print("steps in sequence: \(numberOfSteps)")
        for i in 0 ..< numberOfSteps {
            if (arc4random_uniform(17) > 12) {
                let step = Double(i) * stepSize
                //print("step is \(step)")
                let scale = (minor ? scale2 : scale1)
                let scaleOffset = arc4random_uniform(UInt32(scale.count)-1)
                var octaveOffset = 0
                for _ in 0 ..< 2 {
                    octaveOffset += Int(12 * (((Float(arc4random_uniform(2)))*2.0)+(-1.0)))
                    octaveOffset = Int((Float(arc4random_uniform(2))) * (Float(arc4random_uniform(2))) * Float(octaveOffset))
                }
                //print("octave offset is \(octaveOffset)")
                let noteToAdd = 60 + scale[Int(scaleOffset)] + octaveOffset
                sequencer.tracks[0].add(noteNumber: MIDINoteNumber(noteToAdd),
                                                              velocity: 100,
                                                              position: AKDuration(beats: step),
                                                              duration: AKDuration(beats: 1))
            }
        }
        sequencer.setLength(sequenceLength)
    }
    
    func generateSequence(fromDictionary dictionary: [Int: Bool]) {
        let stepSize: Float = 1/16
        sequencer.tracks[0].clear()
        let numberOfSteps = 15
        for i in 0 ... numberOfSteps {
            if dictionary[i] == true {
                sequencer.tracks[0].add(noteNumber: 69, velocity: 127, position: AKDuration(beats: Double(i)), duration: AKDuration(beats: 0.25))
            }
        }
        sequencer.setLength(sequenceLength)
    }
    
    func changeTempo(_ newTempo: Double) {
        sequencer.setTempo(newTempo)
    }
    
    
}
