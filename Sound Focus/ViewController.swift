//
//  ViewController.swift
//  Sound Focus
//
//  Created by kl on 08/07/2017.
//  Copyright © 2017 kl. All rights reserved.
//

import Cocoa
import AudioKit

class ViewController: NSViewController {
    
    
    //MARK: Button Play/Stop
    @IBOutlet var btnPlay: NSButton!
    
    var btnPlayImageOn: NSImage? = NSImage(named: NSImage.Name(rawValue: "play"))
    var btnPlayImageOff: NSImage? = NSImage(named: NSImage.Name(rawValue: "stop"))
    
    let audioEngine = AudioEngine()
    
    //MARK: shared properties
    let appDelegate = NSApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnPlay(_ sender: Any) {
        btnConfiguration()
    }

    @IBAction func quit(_ sender: NSButton) {
        NSApp.terminate(self)
    }
    
    
    func btnConfiguration() {
        if btnPlay.state.rawValue == 1 {
            btnPlay.image = btnPlayImageOff
            audioEngine.generator.start()
        } else {
            btnPlay.image = btnPlayImageOn
            audioEngine.generator.stop()
        }
    }
    
    
}
