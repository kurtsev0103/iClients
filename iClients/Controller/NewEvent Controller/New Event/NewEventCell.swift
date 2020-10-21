//
//  NewEventCell.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 03/10/2020.
//

import UIKit

class NewEventCell: UITableViewCell {
    
    private let iconImageView = UIImageView(image: nil, contentMode: .scaleAspectFit)
    private let titleLabel = UILabel(textColor: .black)
    private let infoLabel = UILabel(textColor: .lightGray)
    
    weak var viewModel: NewEventCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            iconImageView.image = viewModel.image
            titleLabel.text = viewModel.title
            
            viewModel.info.bind { [unowned self] in
                let string = $0
                infoLabel.text = string
            }
        }
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Constraints
extension NewEventCell {
    private func setupConstraints() {
        let stackView = UIStackView(subviews: [titleLabel, infoLabel], axis: .horizontal, spacing: 8)
        
        addSubview(stackView)
        addSubview(iconImageView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 22),
            iconImageView.widthAnchor.constraint(equalToConstant: 22)
        ])
    }
}
