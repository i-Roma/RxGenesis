//
//  UIView+RoundedCorners.swift
//

import UIKit

extension UIView {
    
    func round(radius: CGFloat = 0, clipsToBounds: Bool = true) {
        let cornerRadius = radius == 0 ? self.bounds.width / 2 : radius
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipsToBounds
    }
    
    func corner(radius: CGFloat, clipsToBounds: Bool = true) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = clipsToBounds
    }
    
    // Call in layoutSubviews()
    func roundSpecific(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
     }
    
    func roundTop(radius: CGFloat = 8) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
    }

    func roundBottom(radius: CGFloat = 8) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        } else {
            // Fallback on earlier versions
        }
    }
    
}

