//
//  String + Extension.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 06/10/2020.
//

import Foundation

extension String {
    func convertStringToDate(dateformat formatType: DateFormatType) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Locale.preferredLanguages.first!)
        dateFormatter.setLocalizedDateFormatFromTemplate(formatType.rawValue)
        return dateFormatter.date(from: self)
    }
}
