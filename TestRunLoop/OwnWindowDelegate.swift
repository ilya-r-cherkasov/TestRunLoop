//
//  OwnWindowDelegate.swift
//  TestRunLoop
//
//  Created by Ilya Cherkasov on 18.07.2021.
//

import Foundation
import Cocoa

class OwnWindowDelegate: NSObject {
    func getButton(with name: String) -> NSButton {
        let button = NSButton(frame: NSRect(x: 0, y: 0, width: 200, height: 40))
        button.title = name
        button.contentTintColor = .blue
        button.setButtonType(.momentaryLight)
        button.bezelStyle = .rounded
        button.target = self
        return button
    }
}

extension OwnWindowDelegate: NSWindowDelegate {
    func windowWillClose(_ notification: Notification) {
        print(notification)
        stop = true
    }
}
