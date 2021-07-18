//
//  getMessage.swift
//  TestRunLoop
//
//  Created by Ilya Cherkasov on 18.07.2021.
//

import Foundation
import Cocoa

func getMessage() -> NSEvent? {
    NSApp.nextEvent(matching: .any, until: Date.distantPast, inMode: .default, dequeue: true)
}
