//
//  Document.swift
//  diaryApp
//
//  Created by Jae Hoon Lee on 8/6/15.
//  Copyright © 2015 Jae Hoon Lee. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
    var viewController: ViewController!
    var documentContents: String = ""

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override func windowControllerDidLoadNib(aController: NSWindowController) {
        super.windowControllerDidLoadNib(aController)
        // Add any code here that needs to be executed once the windowController has loaded the document's window.
    }

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateControllerWithIdentifier("Document Window Controller") as! NSWindowController
        
        
        viewController = windowController.contentViewController as! ViewController
        viewController.textView.string = documentContents
        
        
        self.addWindowController(windowController)
    }

    override func dataOfType(typeName: String) throws -> NSData {
        
        let contents = viewController.textView.string ?? ""
        
        if let data = contents.dataUsingEncoding(NSUTF8StringEncoding) {
            return data
        } else {
            throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        }
    }

    override func readFromData(data: NSData, ofType typeName: String) throws {
        if let contents = NSString(data: data, encoding: NSUTF8StringEncoding) {
            documentContents = contents as String
        } else {
            throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        }
    }


}

