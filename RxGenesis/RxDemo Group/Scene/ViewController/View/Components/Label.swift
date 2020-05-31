//
//  Label.swift
//  RxGenesis
//
//  Created by Roman Romanenko on 30.05.2020.
//  Copyright © 2020 RR. All rights reserved.
//

import UIKit

class Label: UILabel {
    
    // MARK: Properties
    
    var titleText = String() {
        didSet {
            text = titleText
        }
    }
    
    var titleColor: UIColor = .black {
        didSet {
            textColor = titleColor
        }
    }
    
    var titleAlignment: NSTextAlignment = .left {
        didSet {
            textAlignment = titleAlignment
        }
    }
    
    var titleFontName = String() {
        didSet {
            font = UIFont(name: titleFontName, size: fontSize)
        }
    }
    
    var titleSize: CGFloat = 0 {
        didSet {
            font = UIFont(name: font.familyName, size: titleSize)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError(coder.error.debugDescription)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textColor = .systemGray
        textAlignment = .left
        
    }
    
}

