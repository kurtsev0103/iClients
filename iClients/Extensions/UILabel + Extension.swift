//
//  UILabel + Extension.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 04/10/2020.
//

import UIKit

extension UILabel {
    convenience init(text: String? = nil, textColor: UIColor, font: UIFont? = Fonts.avenir16, alignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines        
    }
}
