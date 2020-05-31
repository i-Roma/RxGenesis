//
//  CollectionViewCell+Nib+ID.swift
//  BHIRED
//

import UIKit

extension UICollectionViewCell {
    
    static var id: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    
    static var nib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
}
