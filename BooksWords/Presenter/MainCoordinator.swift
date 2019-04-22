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
        libraryBookViewController.coordinator = self
        
        navigationController.pushViewController(libraryBookViewController, animated: true)
    }
    
    func openBookWords(withLibraryBook libraryBook: LibraryBookViewModel) {
        let vc = BookWordsViewController.instantiate()
        vc.coordinator = self
        vc.libraryBookViewModel = libraryBook
        navigationController.pushViewController(vc, animated: true)
    }
    
    func presentErrorAlertController(withError error: Error) {
        let alertController: UIAlertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        navigationController.present(alertController, animated: true, completion: nil)
    }
}
