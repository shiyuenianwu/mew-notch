//
//  OpenSettingsAction+Focus.swift
//  MewNotch
//

import AppKit
import SwiftUI

extension OpenSettingsAction {
    
    /// Opens the Settings window and brings it to the front.
    ///
    /// MewNotch runs as an accessory app (`LSUIElement` in Info.plist), so the
    /// system does not activate the app when one of its windows opens. Calling
    /// `openSettings()` on its own therefore leaves the settings window behind
    /// whatever app is currently in front.
    ///
    /// Activate explicitly, then raise the window once SwiftUI has created it.
    func callAsFunctionBringingToFront() {
        // Centre while the window is still off screen. Repositioning it after it has
        // been shown is visible as a jump when it opens.
        if let window = Self.settingsWindow, !window.isVisible {
            window.center()
        }
        
        self.callAsFunction()
        
        NSRunningApplication.current.activate(options: [.activateAllWindows])
        
        DispatchQueue.main.async {
            if let window = NSApp.windows.first(
                where: { $0.isVisible && $0.canBecomeKey }
            ) {
                window.makeKeyAndOrderFront(nil)
            }
        }
    }
    
    /// The SwiftUI settings window, matched by the identifier SwiftUI gives it.
    ///
    /// Only the identifier is used here on purpose: unlike the lookup inside
    /// `MewSettingsView`, this runs before the window is shown, and a loose match
    /// could end up centring some other window of the app.
    private static var settingsWindow: NSWindow? {
        NSApp.windows.first { $0.identifier?.rawValue == "com_apple_SwiftUI_Settings_window" }
    }
}
