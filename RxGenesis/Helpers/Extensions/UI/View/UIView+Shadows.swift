//
//  UIView+Shadows.swift
//

import UIKit

extension UIView {
    
    func addShadow(width: CGFloat = 0, height: CGFloat = 0, opacity: Float = 0.5, radius: CGFloat = 2, color: UIColor = .darkGray, masksToBounds: Bool = false) {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: width, height: height)
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowColor = color.cgColor
    }
    
}
