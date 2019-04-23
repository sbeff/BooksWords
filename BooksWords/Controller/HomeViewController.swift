//
//  HomeViewController.swift
//  BooksWords
//
//  Created by Emanuele Beffa on 20/04/2019.
//  Copyright © 2019 Emanuele Beffa. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController, Storyboarded {
    
    // MARK: - Coordinator
    
    weak var coordinator: MainCoordinator?
    
    // MARK: - IBOutlets
    
    @IBOutlet private var logoImageView: UIImageView!
    
    // MARK: - Variables
    
    private var initialLogoFrame: CGRect!
    
    // MARK: - UIViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupNavigationBar()
        setupLogoImageView()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.view.backgroundColor = .clear
    }
    
    private func setupLogoImageView() {
        let panGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        logoImageView.isUserInteractionEnabled = true
        logoImageView.addGestureRecognizer(panGestureRecognizer)
    }
    
    // MARK: - IBActions
    
    @IBAction func chooseFromCollectionButtonTapped() {
        coordinator?.openLibraryBook()
    }
    
    @IBAction func openAnURLButtonTapped() {
        coordinator?.presentOpenAnURLAlertController()
    }
    
    // MARK: - Methods
    
    @objc private func handlePan(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            initialLogoFrame = recognizer.view?.frame
        case .changed:
            let translation: CGPoint = recognizer.translation(in: view)
            
            if let view = recognizer.view {
                view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            }
            
            recognizer.setTranslation(.zero, in: view)
        default:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.5, options: [.curveEaseOut, .allowUserInteraction], animations: { [weak self] in
                guard let self = self else {
                    return
                }
                
                recognizer.view?.frame = self.initialLogoFrame
                }, completion: nil)
        }
    }
}
