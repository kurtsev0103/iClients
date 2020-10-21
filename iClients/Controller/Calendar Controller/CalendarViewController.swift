//
//  CalendarViewController.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 25/09/2020.
//

import UIKit
import JZCalendarWeekView

class CalendarViewController: UIViewController {
    
    private let calendarWeekView = CalendarWeekView()
    private let viewModel = CalendarViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCalendarView()
        setupNavBar()
        calendarWeekView.updateFocusIfNeeded()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        JZWeekViewHelper.viewTransitionHandler(to: size, weekView: calendarWeekView)
    }
    
    // MARK: - Private Methods
    private func setupNavBar() {
        updateNaviBarTitle()
        let image = viewModel.returnImageForCalendarButton()
        let todayButton = UIButton(title: kButtonToday, target: self, action: #selector(scrollToToday))
        let countOfDaysButton = UIButton(image: image, target: self, action: #selector(changeCountOfDays))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: todayButton)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: countOfDaysButton)
    }
    
    @objc private func changeCountOfDays(_ sender: UIButton) {
        viewModel.isOneDay = !viewModel.isOneDay
        sender.setImage(viewModel.returnImageForCalendarButton(), for: .normal)
        setupCalendarViewParams()
    }
    
    @objc private func scrollToToday() {
        setupCalendarViewParams()
    }
    
    private func setupCalendarViewParams() {
        let stringDate = "08:00"
        let date = stringDate.convertStringToDate(dateformat: .time)!
        
        calendarWeekView.setupCalendar(numOfDays: viewModel.isOneDay ? 1 : 7,
                                       setDate: Date(),
                                       allEvents: viewModel.eventsByDate,
                                       scrollType: .pageScroll,
                                       firstDayOfWeek: .Monday,
                                       visibleTime: date)
    }
    
    private func setupCalendarView() {
        view.addSubview(calendarWeekView)
        calendarWeekView.setAnchorConstraintsFullSizeTo(view: view)
        setupCalendarViewParams()
        calendarWeekView.baseDelegate = self
        calendarWeekView.longPressDelegate = self
        calendarWeekView.longPressDataSource = self
        calendarWeekView.longPressTypes = [.addNew, .move]
        calendarWeekView.addNewDurationMins = 120
        calendarWeekView.moveTimeMinInterval = 15
    }
    
    private func updateNaviBarTitle() {
        let date = calendarWeekView.initDate.add(component: .day, value: calendarWeekView.numOfDays)
        navigationItem.title = date.convertDateToString(dateformat: .monthAndYear)
    }
}

// MARK: - JZBaseViewDelegate
extension CalendarViewController: JZBaseViewDelegate {
    func initDateDidChange(_ weekView: JZBaseWeekView, initDate: Date) {
        updateNaviBarTitle()
    }
}

// MARK: - JZLongPressViewDelegate, JZLongPressViewDataSource
extension CalendarViewController: JZLongPressViewDelegate, JZLongPressViewDataSource {
    func weekView(_ weekView: JZLongPressWeekView, viewForAddNewLongPressAt startDate: Date) -> UIView {
        Vibration.heavy.vibrate()
        return CalendarEventCell()
    }
    
    func weekView(_ weekView: JZLongPressWeekView, didEndAddNewLongPressAt startDate: Date) {
        Vibration.heavy.vibrate()
        let vc = NewEventViewController(startDate: startDate)
        let nvc = UINavigationController(rootViewController: vc)
        present(nvc, animated: true)
    }
    
    func weekView(_ weekView: JZLongPressWeekView, editingEvent: JZBaseEvent, didEndMoveLongPressAt startDate: Date) {
        Vibration.heavy.vibrate()
        guard let event = editingEvent as? Event else { return }
        let duration = Calendar.current.dateComponents([.minute], from: event.startDate, to: event.endDate).minute!
        let selectedIndex = viewModel.events.firstIndex(where: { $0.id == event.id })!
        viewModel.events[selectedIndex].startDate = startDate
        viewModel.events[selectedIndex].endDate = startDate.add(component: .minute, value: duration)
        viewModel.eventsByDate = JZWeekViewHelper.getIntraEventsByDate(originalEvents: viewModel.events)
        weekView.forceReload(reloadEvents: viewModel.eventsByDate)
    }
}
