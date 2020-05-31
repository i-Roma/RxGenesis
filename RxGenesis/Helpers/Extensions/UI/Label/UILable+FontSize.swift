//
//  UILable+FontSize.swift
//

import UIKit

public extension UILabel {
    /// Convenience way to change font size.
    var fontSize: CGFloat {
        get {
            return font?.pointSize ?? UIFont.labelFontSize
        }
        set(value) {
            font = font?.withSize(value) ?? UIFont.systemFont(ofSize: value)
        }
    }
}
