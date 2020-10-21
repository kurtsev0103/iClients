//
//  UIButton + Extension.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 04/10/2020.
//

import UIKit

extension UIButton {
    convenience init(title: String, titleColor: UIColor = .black, font: UIFont? = Fonts.avenir16, target: Any?, action: Selector) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        self.addTarget(target, action: action, for: .touchUpInside)
    }
    
    convenience init(image: UIImage?, target: Any?, action: Selector) {
        self.init(type: .system)
        self.setImage(image, for: .normal)
        self.addTarget(target, action: action, for: .touchUpInside)
        
        self.widthAnchor.constraint(equalToConstant: 25).isActive = true
        self.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
}
