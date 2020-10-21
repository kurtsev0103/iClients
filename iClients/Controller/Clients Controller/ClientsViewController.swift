//
//  ClientsViewController.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 25/09/2020.
//

import UIKit

class ClientsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBasic()
    }
    
    // MARK: - Private Methods
    private func setupBasic() {
        view.backgroundColor = Colors.mainWhite
        navigationItem.title = kTitleClients
    }
}
