//
//  OwnAppDelegate.swift
//  TestRunLoop
//
//  Created by Ilya Cherkasov on 18.07.2021.
//

import Foundation
import Cocoa

class OwnAppDelegate: NSObject {
    
}

extension OwnAppDelegate: NSApplicationDelegate {
    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
        stop = true
        return .terminateCancel
    }
}
