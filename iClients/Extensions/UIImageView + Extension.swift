//
//  UIImageView + Extension.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 03/10/2020.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?, contentMode: UIView.ContentMode = .scaleAspectFit) {
        self.init(image: image)
        self.contentMode = contentMode
    }
}
