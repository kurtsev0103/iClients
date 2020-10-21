//
//  DatePickerCellModel.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 06/10/2020.
//

import UIKit

enum DatePickerModelType {
    case startDate
    case endDate
    case duration
}

struct DatePickerCellModel {
    var date: Box<Date>
    let type: DatePickerModelType
    var indexPath: IndexPath?
}
