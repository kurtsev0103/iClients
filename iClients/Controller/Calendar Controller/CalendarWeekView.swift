//
//  LongPressWeekView.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 02/10/2020.
//

import UIKit
import JZCalendarWeekView

class CalendarWeekView: JZLongPressWeekView {

    override func registerViewClasses() {
        super.registerViewClasses()
        collectionView.register(CalendarEventCell.self, forCellWithReuseIdentifier: CalendarEventCell.className)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarEventCell.className, for: indexPath) as? CalendarEventCell,
            let event = getCurrentEvent(with: indexPath) as? Event {
            cell.configureCell(event: event)
            return cell
        }
        preconditionFailure("LongPressEventCell and AllDayEvent should be casted")
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedEvent = getCurrentEvent(with: indexPath) as? Event {
            print(selectedEvent)
        }
    }
}
