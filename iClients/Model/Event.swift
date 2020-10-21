//
//  Event.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 25/09/2020.
//

import Foundation
import JZCalendarWeekView

class Event: JZBaseEvent {

    let client: Client
    let services: [Service]
    let comment: String?

    init(id: String = UUID().uuidString, startDate: Date, endDate: Date, services: [Service], client: Client, comment: String?) {
        self.services = services
        self.client = client
        self.comment = comment
        super.init(id: id, startDate: startDate, endDate: endDate)
    }
    
    override func copy(with zone: NSZone?) -> Any {
        return Event(id: id, startDate: startDate, endDate: endDate, services: services, client: client, comment: comment)
    }
}
