//
//  DatePickerViewModel.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 06/10/2020.
//

import Foundation

class DatePickerViewModel {
    
    private var startDate: Date
    private var endDate: Date
    private var duration: Date
    
    lazy var cells = [
        DatePickerCellModel(date: Box(startDate), type: .startDate, indexPath: nil),
        DatePickerCellModel(date: Box(endDate), type: .endDate, indexPath: nil),
        DatePickerCellModel(date: Box(duration), type: .duration, indexPath: nil)
    ]

    init(startDate: Date) {
        self.startDate = startDate
        self.endDate = startDate.add(component: .hour, value: 2)
        let durationString = "02:00"
        self.duration = durationString.convertStringToDate(dateformat: .time)!
    }

    func cellViewModel(forIndexPath indexPath: IndexPath) -> DatePickerCellViewModel {
        var cell = cells[indexPath.row - 1]
        cell.indexPath = indexPath
        return DatePickerCellViewModel(cell: cell)
    }
    
    func changeDateInDatePicker(indexPath: IndexPath, date: Date) {
        let cell = cells[indexPath.row - 1]
        cell.date.value = date
    }
}
