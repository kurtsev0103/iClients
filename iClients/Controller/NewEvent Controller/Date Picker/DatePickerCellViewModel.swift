//
//  DatePickerCellViewModel.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 06/10/2020.
//

import UIKit

class DatePickerCellViewModel {
    
    private var cell: DatePickerCellModel
    
    var date: Box<Date> {
        return cell.date
    }
    
    var type: DatePickerModelType {
        return cell.type
    }
    
    var indexPath: IndexPath? {
        return cell.indexPath
    }

    init(cell: DatePickerCellModel) {
        self.cell = cell
    }
}
