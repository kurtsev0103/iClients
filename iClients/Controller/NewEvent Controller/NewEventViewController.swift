//
//  NewEventViewController.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 02/10/2020.
//

import UIKit
import JZCalendarWeekView

class NewEventViewController: UIViewController {
    
    private let tableView = UITableView()
    private let newEventViewModel: NewEventViewModel
    private let datePickerViewModel: DatePickerViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavBar()
    }
    
    init(startDate: Date) {
        newEventViewModel = NewEventViewModel(startDate: startDate)
        datePickerViewModel = DatePickerViewModel(startDate: startDate)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.setAnchorConstraintsFullSizeTo(view: view)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = Colors.mainWhite
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NewEventCell.self, forCellReuseIdentifier: NewEventCell.className)
        tableView.register(DatePickerCell.self, forCellReuseIdentifier: DatePickerCell.className)
    }
    
    private func setupNavBar() {
        let cancelButton = UIButton(title: kButtonCancel, target: self, action: #selector(cancelButtonTapped))
        let saveButton = UIButton(title: kButtonSave, target: self, action: #selector(saveButtonTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancelButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: saveButton)
        navigationController?.navigationBar.barTintColor = Colors.mainWhite
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: Fonts.avenir20!]
        navigationItem.title = kNewEvent
    }
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func saveButtonTapped() {
        dismiss(animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension NewEventViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return newEventViewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newEventViewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return newEventViewModel.heightForRow(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return newEventViewModel.heightForHeaders()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return newEventViewModel.headerView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newEventViewModel.updateSelectedRow(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if newEventViewModel.isDatePickerIndexPathIsEquel(indexPath: indexPath) {
            let datePickerCell = tableView.dequeueReusableCell(withIdentifier: DatePickerCell.className) as! DatePickerCell
            let datePickerCellViewModel = datePickerViewModel.cellViewModel(forIndexPath: indexPath)
            datePickerCell.viewModel = datePickerCellViewModel
            datePickerCell.delegate = self
            return datePickerCell
        } else {
            let newEventCell = tableView.dequeueReusableCell(withIdentifier: NewEventCell.className) as! NewEventCell
            let newEventCellViewModel = newEventViewModel.cellViewModel(forIndexPath: indexPath)
            newEventCell.viewModel = newEventCellViewModel
            return newEventCell
        }
    }
}

// MARK: - DatePickerDelegate
extension NewEventViewController: DatePickerDelegate {
    func didChangeDate(date: Date, indexPath: IndexPath) {
        newEventViewModel.changeDateInInfoLabel(indexPath: indexPath, date: date)
        datePickerViewModel.changeDateInDatePicker(indexPath: indexPath, date: date)
    }
}
