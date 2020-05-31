//
//  UITableViewCell+Nib+ID.swift
//
//  Created by Roman Romanenko
//

import UIKit

extension UITableViewCell {
    
    static var id: String {
        return String(describing: self)
    }
}

extension UITableViewCell {
    
    static var nib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
}
