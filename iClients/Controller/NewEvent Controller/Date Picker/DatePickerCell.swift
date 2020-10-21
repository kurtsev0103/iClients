//
//  DatePickerCell.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 05/10/2020.
//

import UIKit

protocol DatePickerDelegate: class {
    func didChangeDate(date: Date, indexPath: IndexPath)
}

class DatePickerCell: UITableViewCell {
        
    private let datePicker = UIDatePicker()
    private var indexPath: IndexPath!
    weak var delegate: DatePickerDelegate?
    
    weak var viewModel: DatePickerCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            indexPath = viewModel.indexPath
            setupDatePickerModeWith(viewModel: viewModel)
            
            viewModel.date.bind { [unowned self] in
                let date = $0
                datePicker.setDate(date, animated: true)
            }
        }
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(datePicker)
        datePicker.setAnchorConstraintsFullSizeTo(view: self)
        datePicker.addTarget(self, action: #selector(dateDidChange), for: .valueChanged)
        datePicker.locale = Locale(identifier: Locale.preferredLanguages.first!)
        datePicker.minuteInterval = 5
    }
    
    private func setupDatePickerModeWith(viewModel: DatePickerCellViewModel) {
        switch viewModel.type {
        case .startDate: datePicker.datePickerMode = .dateAndTime
        case .endDate: datePicker.datePickerMode = .dateAndTime
        case .duration: datePicker.datePickerMode = .time
        }
    }
    
    @objc private func dateDidChange(_ sender: UIDatePicker) {
        delegate?.didChangeDate(date: sender.date, indexPath: indexPath)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

