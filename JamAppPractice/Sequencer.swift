//
//  Sequencer.swift
//  JamAppPractice
//
//  Created by Patrick O'Leary on 3/31/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import Foundation

//extension OrcSequencer() {
//    
//    func generateRandomSequence(_ stepSize: Float = 1/8, minor: Bool = false, clear: Bool = true) {
//        if (clear) { sequencer.tracks[0].clear() }
//        sequencer.setLength(sequenceLength)
//        let numberOfSteps = Int(Float(sequenceLength.beats)/stepSize)
//        print("Number of steps *****\(numberOfSteps)")
//        //print("steps in sequence: \(numberOfSteps)")
//        for i in 0 ..< numberOfSteps {
//            if (arc4random_uniform(17) > 12) {
//                let step = Double(i) * stepSize
//                //print("step is \(step)")
//                let scale = (minor ? scale2 : scale1)
//                let scaleOffset = arc4random_uniform(UInt32(scale.count)-1)
//                var octaveOffset = 0
//                for _ in 0 ..< 2 {
//                    octaveOffset += Int(12 * (((Float(arc4random_uniform(2)))*2.0)+(-1.0)))
//                    octaveOffset = Int((Float(arc4random_uniform(2))) * (Float(arc4random_uniform(2))) * Float(octaveOffset))
//                }
//                //print("octave offset is \(octaveOffset)")
//                let noteToAdd = 60 + scale[Int(scaleOffset)] + octaveOffset
//                sequencer.tracks[0].add(noteNumber: MIDINoteNumber(noteToAdd),
//                                        velocity: 100,
//                                        position: AKDuration(beats: step),
//                                        duration: AKDuration(beats: 1))
//            }
//        }
//        sequencer.setLength(sequenceLength)
//    }


//       func generateSequence(fromDictionary dictionary: [Int: Bool]) {
//sequencer.tracks[0].clear()
//let numberOfSteps = 15
//for i in 0 ... numberOfSteps {
//    if dictionary[i] == true {
//        sequencer.tracks[0].add(noteNumber: 69, velocity: 127, position: AKDuration(beats: Double(i)), duration: AKDuration(beats: 0.25))
//    }
//}
//sequencer.setLength(sequenceLength)
//}
//}
