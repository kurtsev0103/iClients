//
//  MainTabBarController.swift
//  iClients
//
//  Created by Oleksandr Kurtsev on 25/09/2020.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addViewControllers()
        setupTabBar()
    }
    
    // MARK: - Private Methods
    private func addViewControllers() {
        viewControllers = [
            generateNavigationController(rootVC: CalendarViewController(), image: createSystemImage(imageName: "calendar")),
            generateNavigationController(rootVC: ServicesViewController(), image: createSystemImage(imageName: "book")),
            generateNavigationController(rootVC: ClientsViewController(), image: createSystemImage(imageName: "person.2"))
        ]
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .black
        tabBar.barTintColor = Colors.mainWhite
        tabBar.isTranslucent = false
    }
    
    private func generateNavigationController(rootVC: UIViewController, image: UIImage?) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.navigationBar.barTintColor = Colors.mainWhite
        navigationVC.navigationBar.isTranslucent = false
        navigationVC.tabBarItem.image = image
        navigationVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: Fonts.avenir20!]
        return navigationVC
    }
    
    private func createSystemImage(imageName: String) -> UIImage? {
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        return UIImage(systemName: imageName, withConfiguration: boldConfig)
    }
}
