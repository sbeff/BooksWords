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
        presentErrorAlertController(withErrorMessage: error.localizedDescription)
    }
    
    func presentOpenAnURLAlertController() {
        let alertController: UIAlertController = UIAlertController(title: "Open an URL (only https protocol is supported)", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "URL"
            textField.autocapitalizationType = .none
            textField.textAlignment = .center
            textField.autocorrectionType = .no
        }
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [unowned self, alertController] _ in
            if let urlString = alertController.textFields?[0].text {
                if urlString.hasPrefix("https://") {
                    let libraryBookViewModel = LibraryBookViewModel(book: Book(title: "", author: "", fileName: urlString))
                    self.openBookWords(withLibraryBook: libraryBookViewModel)
                } else {
                    self.presentErrorAlertController(withErrorMessage: "The URL provided is not valid")
                }
            }
        }))
        
        navigationController.present(alertController, animated: true, completion: nil)
    }
    
    func presentErrorAlertController(withErrorMessage message: String) {
        let alertController: UIAlertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        navigationController.present(alertController, animated: true, completion: nil)
    }
}
