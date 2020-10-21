//
//  UIStackView + Extension.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 29/09/2020.
//

import UIKit

extension UIStackView {
    convenience init(subviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0) {
        self.init(arrangedSubviews: subviews)
        self.axis = axis
        self.spacing = spacing
    }
}
