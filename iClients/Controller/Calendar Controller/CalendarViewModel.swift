//
//  CalendarViewModel.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 02/10/2020.
//

import Foundation
import JZCalendarWeekView

class CalendarViewModel: NSObject {
        
    private let firstDate  = Date().add(component: .hour, value: 1)
    private let secondDate = Date().add(component: .day, value: 1)
    private let thirdDate  = Date().add(component: .day, value: 2)
    
    private let client1    = Client(name: "Леся", phone: 661999590, description: nil)
    private let client2    = Client(name: "Оля", phone: 665003953, description: nil)
    private let client3    = Client(name: "Маша", phone: 555234176, description: nil)
    
    private let service1   = Service(name: "Ж стрижка", price: 70, duration: nil)
    private let service2   = Service(name: "Балаяж", price: 240, duration: nil)
    private let service3   = Service(name: "Ботокс", price: 130, duration: nil)

    lazy var events = [
        Event(startDate: firstDate, endDate: firstDate.add(component: .hour, value: 1), services: [service1], client: client1, comment: ""),
        Event(startDate: secondDate, endDate: secondDate.add(component: .hour, value: 2), services: [service2], client: client2, comment: ""),
        Event(startDate: thirdDate, endDate: thirdDate.add(component: .hour, value: 2), services: [service3], client: client3, comment: "")
    ]

    lazy var isOneDay = true
    lazy var eventsByDate = JZWeekViewHelper.getIntraEventsByDate(originalEvents: events)
    
    func returnImageForCalendarButton() -> UIImage? {
        return isOneDay ? UIImage(named: kImageCalendar7) : UIImage(named: kImageCalendar1)
    }
}
