//
//  UIApplication+OpenSettings.swift
//  MODsense
//
//  Created by Roman Romanenko on 11/14/19.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import UIKit

extension UIApplication {
    
    class func openSettings() {
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else { return }
        if let settingsURL = URL(string: UIApplication.openSettingsURLString + bundleIdentifier) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(settingsURL as URL)
            } else {
                UIApplication.shared.open(settingsURL as URL)
            }
        }
    }
    
    class func openSettingsWithCompletion(completed: @escaping () -> Swift.Void) {
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else { return }
        if let settingsURL = URL(string: UIApplication.openSettingsURLString + bundleIdentifier) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(settingsURL as URL) { done in
                    completed()
                }
            } else {
                UIApplication.shared.open(settingsURL as URL) { done in
                    completed()
                }
            }
        }
    }
    
}
