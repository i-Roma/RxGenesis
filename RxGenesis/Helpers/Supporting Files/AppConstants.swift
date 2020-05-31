//
//  AppConstants.swift
//  BitMinerals
//
//  Created by Roman Romanenko on 5/6/18.
//  Copyright © 2018 Roman Billionaire. All rights reserved.
//

import UIKit

enum Theme {
    case light
    case dark
}

struct AppColor {
    
    static var theme: Theme?
    
    static let purple = UIColor.init(red: 27/255, green: 34/255, blue: 44/255, alpha: 1)
    static let purpleDark = UIColor.init(red: 20/255, green: 27/255, blue: 37/255, alpha: 1)
    static let rose = UIColor.init(red: 208/255, green: 50/255, blue: 89/255, alpha: 1)
    static let red = UIColor(red: 246/255, green: 85/255, blue: 53/255, alpha: 1)
    static let green = UIColor(red: 0/255, green: 164/255, blue: 91/255, alpha: 1)
    static let mint = UIColor.init(red: 38/255, green: 194/255, blue: 168/255, alpha: 1)
    
    static var mainBackround: UIColor {
        if theme == .dark {
            return purple
        } else {
            return .white
        }
    }
    
}
