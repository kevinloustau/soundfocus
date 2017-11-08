//
//  AppDelegate.swift
//  Sound Focus
//
//  Created by kl on 08/07/2017.
//  Copyright © 2017 kl. All rights reserved.
//

import Cocoa
import AudioKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let popoverView = NSPopover()
 
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        statusItem.button?.image = NSImage(named: NSImage.Name(rawValue: "logo"))
        statusItem.button!.action = #selector(togglePopover)
    }
    
    //MARK: Useful function to handle app and display
    @objc func togglePopover(_ sender: AnyObject?) {
        if popoverView.isShown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }
    
    func showPopover(_ sender: AnyObject?) {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "ViewControllerStoryboard")) as? ViewController else { return }
        popoverView.contentViewController = vc
        popoverView.behavior = .transient
        popoverView.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: .maxY)
    }
    
    func closePopover(_ sender: AnyObject?) {
        popoverView.performClose(sender)
    }
    
    func quit(_ sender : NSMenuItem) {
        NSApp.terminate(self)
    }

}

