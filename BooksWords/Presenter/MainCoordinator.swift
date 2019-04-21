//
//  MainCoordinator.swift
//  BooksWords
//
//  Created by Emanuele Beffa on 21/04/2019.
//  Copyright © 2019 Emanuele Beffa. All rights reserved.
//

import UIKit

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController.instantiate()
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: false)
    }
    
    func openLibraryBook() {
        let libraryBookViewController: LibraryBookViewController = LibraryBookViewController.instantiate()
        
        navigationController.pushViewController(libraryBookViewController, animated: true)
    }
}
