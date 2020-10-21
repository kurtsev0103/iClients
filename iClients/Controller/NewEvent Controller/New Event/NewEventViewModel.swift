//
//  NewEventViewModel.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 05/10/2020.
//

import UIKit

class NewEventViewModel {
    
    private var startDate: Date
    private var endDate: Date
    private var duration: Date
    private var datePickerIndexPath: IndexPath?
    
    lazy var cells = [
        NewEventCellModel(title: kTitleClient, info: Box(kTitleSelectClient), image: UIImage(systemName: "person")),
        NewEventCellModel(title: kTitleServices, info: Box(kTitleSelectServices), image: UIImage(systemName: "book")),
        NewEventCellModel(title: kTitleStart, info: Box(startDate.convertDateToString(dateformat: .dateWithTime)), image: UIImage(systemName: "clock")),
        NewEventCellModel(title: kTitleEnd, info: Box(endDate.convertDateToString(dateformat: .dateWithTime)), image: UIImage(systemName: "clock")),
        NewEventCellModel(title: kTitleDuration, info: Box(duration.convertDateToString(dateformat: .time)), image: UIImage(systemName: "timer")),
        NewEventCellModel(title: kTitlePrice, info: Box(kTitleEnterPrice), image: UIImage(systemName: "dollarsign.circle")),
        NewEventCellModel(title: kTitleComment, info: Box(kTitleEnterComment), image: UIImage(systemName: "text.bubble"))
    ]
    
    init(startDate: Date) {
        self.startDate = startDate
        self.endDate = startDate.add(component: .hour, value: 2)
        let durationString = "02:00"
        self.duration = durationString.convertStringToDate(dateformat: .time)!
    }
    
    func numberOfSections() -> Int {
        return 4
    }
    
    func heightForHeaders() -> CGFloat {
        return 22.0
    }
    
    func heightForRow(indexPath: IndexPath) -> CGFloat {
        return datePickerIndexPath == indexPath ? 162.0 : 44.0
    }
    
    func headerView() -> UIView {
        let view = UIView()
        view.backgroundColor = Colors.mainWhite
        return view
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return datePickerIndexPath == nil ? 3 : 4
        case 2: return 1
        case 3: return 1
        default: return 0
        }
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> NewEventCellViewModel {
        switch indexPath.section {
        case 0 where indexPath.row == 0 : return NewEventCellViewModel(cell: cells[0])
        case 0 where indexPath.row == 1 : return NewEventCellViewModel(cell: cells[1])
        case 1 where indexPath.row == 0 : return NewEventCellViewModel(cell: cells[2])
        case 1 where indexPath.row == 1 : return NewEventCellViewModel(cell: cells[3])
        case 1 where indexPath.row == 2 : return NewEventCellViewModel(cell: cells[4])
        case 2 where indexPath.row == 0 : return NewEventCellViewModel(cell: cells[5])
        case 3 where indexPath.row == 0 : return NewEventCellViewModel(cell: cells[6])
        default: fatalError()
        }
    }
    
    func changeDateInInfoLabel(indexPath: IndexPath, date: Date) {
        switch indexPath.row - 1 {
        case 0: cells[2].info.value = date.convertDateToString(dateformat: .dateWithTime)
        case 1: cells[3].info.value = date.convertDateToString(dateformat: .dateWithTime)
        case 2: cells[4].info.value = date.convertDateToString(dateformat: .time)
        default: fatalError()
        }
    }
    
    func returnDate(forIndexPath indexPath: IndexPath) -> Date {
        switch indexPath.row - 1 {
        case 0: return startDate
        case 1: return endDate
        case 2: return duration
        default: fatalError()
        }
    }
    
    func isDatePickerIndexPathIsEquel(indexPath: IndexPath) -> Bool {
        return datePickerIndexPath == indexPath
    }
    
    func indexPathToInsertDatePicker(indexPath: IndexPath) {
        if let datePickerIndexPath = datePickerIndexPath, datePickerIndexPath.row < indexPath.row {
            self.datePickerIndexPath = indexPath
        } else {
            self.datePickerIndexPath = IndexPath(row: indexPath.row + 1, section: indexPath.section)
        }
    }
    
    func updateSelectedRow(tableView: UITableView, indexPath: IndexPath) {
        tableView.beginUpdates()
        if let datePickerIndexPath = datePickerIndexPath, datePickerIndexPath.row - 1 == indexPath.row {
            tableView.deleteRows(at: [datePickerIndexPath], with: .fade)
            self.datePickerIndexPath = nil
        } else if let datePickerIndexPath = datePickerIndexPath, indexPath.section != 1 {
            tableView.deleteRows(at: [datePickerIndexPath], with: .fade)
            self.datePickerIndexPath = nil
        } else if indexPath.section == 1 {
            if let datePickerIndexPath = datePickerIndexPath {
                tableView.deleteRows(at: [datePickerIndexPath], with: .fade)
            }
            indexPathToInsertDatePicker(indexPath: indexPath)
            tableView.insertRows(at: [datePickerIndexPath!], with: .fade)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.endUpdates()
    }    
}
