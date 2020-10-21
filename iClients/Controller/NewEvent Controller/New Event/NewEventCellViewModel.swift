//
//  NewEventCellViewModel.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 05/10/2020.
//

import UIKit

class NewEventCellViewModel {
    
    private var cell: NewEventCellModel
    
    var image: UIImage? {
        return cell.image
    }
    
    var title: String {
        return cell.title
    }
    
    var info: Box<String> {
        return cell.info
    }
    
    init(cell: NewEventCellModel) {
        self.cell = cell
    }
}
