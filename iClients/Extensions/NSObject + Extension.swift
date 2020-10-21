//
//  NSObject + Extension.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 29/09/2020.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}
