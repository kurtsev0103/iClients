//
//  Date + Extension.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 30/09/2020.
//

import Foundation

enum DateFormatType: String {
    case hours = "HH"
    case minutes = "mm"
    case time = "HH:mm"
    case date = "dd.MM.yyyy"
    case monthAndYear = "MMMM YYYY"
    case dateWithTime = "dd.MMMM.yyyy  HH:mm"
}

extension Date {
    func add(component: Calendar.Component, value: Int) -> Date {
        return Calendar.current.date(byAdding: component, value: value, to: self)!
    }

    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    func convertDateToString(dateformat formatType: DateFormatType) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Locale.preferredLanguages.first!)
        dateFormatter.setLocalizedDateFormatFromTemplate(formatType.rawValue)
        return dateFormatter.string(from: self)
    }
    
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }

    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
}
