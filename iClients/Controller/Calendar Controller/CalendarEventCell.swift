//
//  CalendarEventCell.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 02/10/2020.
//

import UIKit
import JZCalendarWeekView

class CalendarEventCell: JZLongPressEventCell {

    let titleLabel = UILabel(text: kNewEvent, textColor: .black, font: Fonts.avenir14, numberOfLines: 0)
    let descriptionLabel = UILabel(textColor: .black, font: Fonts.avenir12, numberOfLines: 0)
    let borderView = UIView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        setupBasic()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(event: Event) {
        self.event = event
        titleLabel.text = event.client.name
        descriptionLabel.text = stringFromArray(services: event.services)
    }
    
    private func stringFromArray(services: [Service]) -> String {
        guard services.count > 1 else { return services[0].name }
        print("Больше одного сервиса")
        return services[0].name
    }
    
    private func setupBasic() {
        clipsToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0
        borderView.backgroundColor = UIColor(hex: 0x0899FF)
        contentView.backgroundColor = UIColor(hex: 0xEEF7FF)
    }
}

// MARK: - Setup Constraints
extension CalendarEventCell {
    private func setupConstraints() {
        contentView.addSubview(borderView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)

        borderView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: topAnchor),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            borderView.bottomAnchor.constraint(equalTo: bottomAnchor),
            borderView.widthAnchor.constraint(equalToConstant: 2),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 2),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3)
        ])
    }
}
