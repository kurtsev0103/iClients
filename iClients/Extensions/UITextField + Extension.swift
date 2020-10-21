//
//  UITextField + Extension.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 04/10/2020.
//

import UIKit

extension UITextField {
    convenience init(placeholder: String? = nil, padding: CGFloat = 12, cornerRadius: CGFloat = 5, keyboardType: UIKeyboardType = .default, textColor: UIColor = .black, bgColor: UIColor = .white, alignment: NSTextAlignment = .left,  isSecureTextEntry: Bool = false) {
        self.init(frame: .zero)
        self.placeholder        = placeholder
        self.textColor          = textColor
        self.backgroundColor    = bgColor
        self.keyboardType       = keyboardType
        self.textAlignment      = alignment
        self.isSecureTextEntry  = isSecureTextEntry
        self.layer.cornerRadius = cornerRadius
        
        attributedPlaceholder   = NSAttributedString(string: placeholder ?? "", attributes: [.foregroundColor: UIColor.lightGray])
    }
}
