//
//  main.swift
//  TestRunLoop
//
//  Created by Ilya Cherkasov on 18.07.2021.
//

import Cocoa


// MARK: - GLOBAL -

public var stop = false

// MARK: - Application -

let application = NSApplication.shared
print(application)
application.setActivationPolicy(.regular)
let appDelegate = OwnAppDelegate()

application.delegate = appDelegate
application.finishLaunching()

let menuBar = NSMenu()
let appMenuItem = NSMenuItem()
menuBar.addItem(appMenuItem)
application.mainMenu = menuBar

let appMenu = NSMenu()
let appName = ProcessInfo.processInfo.processName
let quitTitle: String = "Quit " + appName
let quitMenuItem = NSMenuItem(title: quitTitle, action: nil, keyEquivalent: "q")
appMenu.addItem(quitMenuItem)
appMenuItem.submenu = appMenu

let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 500, height: 500), styleMask: .titled, backing: .buffered, defer: false)
window.isReleasedWhenClosed = false

let windowDelegate = OwnWindowDelegate()
window.delegate = windowDelegate
let contentView: NSView = window.contentView!
let button: NSButton = windowDelegate.getButton(with: "Hello World!")
contentView.addSubview(button)

window.cascadeTopLeft(from: NSPoint(x: 20, y: 20))
window.title = "RunLoop"

window.makeKeyAndOrderFront(window)
window.acceptsMouseMovedEvents = true
application.activate(ignoringOtherApps: true)

print("entering runloop\n----------------\n")
while(!stop)
{
    let event: NSEvent? = getMessage()
    if event != nil {
        switch event!.type {
        case .mouseMoved:
            break
        case .leftMouseDragged:
            break
        case .otherMouseDragged:
            print(".otherMouseDragged")
        default:
            print(event!.type)
        }
        application.sendEvent(event!)
    }
    if stop { break }
    application.updateWindows()
    usleep(100)
}
print("leaving runloop\n----------------\n")
