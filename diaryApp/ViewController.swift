//
//  ViewController.swift
//  diaryApp
//
//  Created by Jae Hoon Lee on 8/6/15.
//  Copyright © 2015 Jae Hoon Lee. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    let speechSynthesizer = NSSpeechSynthesizer()
    
    @IBOutlet var textView: NSTextView!
    
    @IBAction func speakButtonPressed(sender: NSButton) {
        if let contents = textView.string {
            speechSynthesizer.startSpeakingString(contents)
        } else {
            speechSynthesizer.startSpeakingString("The document is empty.")
        }
    }
    
    @IBAction func stopButtonPressed(sender: NSButton) {
        speechSynthesizer.stopSpeaking()
    }
}
