//
//  UIView+Shadow+RoundedCorners.swift
//

import UIKit

extension UIView {
    
    func addShadowWithRoundedCorners(to layer: CALayer, width: CGFloat = 0, height: CGFloat = 0, opacity: Float = 0.5, cornerRadius: CGFloat = 2, shadowRadius: CGFloat = 2, color: UIColor = .darkGray) {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: width, height: height)
        layer.shadowOpacity = opacity
        layer.shadowRadius = shadowRadius
    }
    
    func addShadowWithRoundedCorners(to view: UIView, width: CGFloat = 0, height: CGFloat = 0, opacity: Float = 0.5, cornerRadius: CGFloat = 2, shadowRadius: CGFloat = 2, color: UIColor = .darkGray) {
        view.layer.cornerRadius = cornerRadius
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOffset = CGSize(width: width, height: height)
        view.layer.shadowOpacity = opacity
        view.layer.shadowRadius = shadowRadius
    }
}
