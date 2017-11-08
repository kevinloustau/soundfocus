//
//  AudioEngine.swift
//  Sound Focus
//
//  Created by kl on 08/07/2017.
//  Copyright © 2017 kl. All rights reserved.
//

import Foundation
import AudioKit


class AudioEngine {
    
    static let sharedInstance = AudioEngine()

    var generator: AKOperationGenerator!
    
    
    init() {
        createGenerator()
        AudioKit.output = generator
        AudioKit.start()
    }
    
    
    func instrument(noteNumber: MIDINoteNumber, rate: Double, amplitude: Double) -> AKOperation {
        let metro = AKOperation.metronome(frequency: 82.0 / (60.0 * rate))
        let frequency = noteNumber.midiNoteToFrequency()
        return AKOperation.fmOscillator(baseFrequency: frequency, amplitude: amplitude).triggeredWithEnvelope(trigger: metro, attack: 0.5, hold: 1, release: 1)
    }

    
    func createGenerator() {
        generator = AKOperationGenerator { _ in
            let instrument1 = instrument(noteNumber: 60, rate: 10, amplitude: 0.5)
            let instrument2 = instrument(noteNumber: 62, rate: 2, amplitude: 0.4)
            let instrument3 = instrument(noteNumber: 65, rate: 1, amplitude: 1.3 / 4.0)
            let instrument4 = instrument(noteNumber: 67, rate: 10, amplitude: 0.125)
            
            let instrument5 = instrument(noteNumber: 50, rate: 5, amplitude: 0.6)
            let instrument6 = instrument(noteNumber: 52, rate: 1, amplitude: 0.6)
            let instrument7 = instrument(noteNumber: 55, rate: 10, amplitude: 0.6)
            
            let instruments = (instrument1 + instrument2 + instrument3 + instrument4 + instrument5 + instrument6 + instrument7) * 0.1
            
            let reverb = instruments.reverberateWithCostello(feedback: 0.9, cutoffFrequency: 10_000).toMono()
            
            return mixer(instruments, reverb, balance: 0.4)
        }
    }
}
