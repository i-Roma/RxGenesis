//
//  TextField.swift
//  RxGenesis
//
//  Created by Roman Romanenko on 30.05.2020.
//  Copyright © 2020 RR. All rights reserved.
//

import UIKit

class TextField: UITextField {

    let ai = UIActivityIndicatorView(style: .medium)
    
    convenience init() {
        self.init(frame: .zero)
        
        rightViewMode = .always
        rightView = ai
        ai.color = .systemBlue
        ai.startAnimating()
        ai.isHidden = true
    }

}
