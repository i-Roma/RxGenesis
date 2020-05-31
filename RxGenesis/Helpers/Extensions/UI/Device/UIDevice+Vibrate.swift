//
//  UIDevice+Vibrate.swift
//  DCG
//
//  Created by Roman Romanenko on 15.04.2020.
//  Copyright © 2020 Roman Romanenko. All rights reserved.
//

import UIKit

extension UIDevice {

    static func vibrate(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .heavy) {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: style)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
    
    static func vibrateMultiple(quantyties: Int = 2, delay index: Double = 4, style: UIImpactFeedbackGenerator.FeedbackStyle = .heavy) {
        for i in 0..<quantyties {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i * 1) / index) {
                self.vibrate(style)
            }
        }
    }
}
