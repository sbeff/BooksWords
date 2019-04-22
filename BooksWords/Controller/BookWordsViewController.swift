//
//  BookWordsViewController.swift
//  BooksWords
//
//  Created by Emanuele Beffa on 22/04/2019.
//  Copyright © 2019 Emanuele Beffa. All rights reserved.
//

import UIKit

class BookWordsViewController: UIViewController, Storyboarded {
    
    // MARK: - Coordinator
    
    weak var coordinator: MainCoordinator?
    
    // MARK: - ViewModel
    
    var libraryBookViewModel: LibraryBookViewModel!
    
    private var viewModel: [BookWordViewModel] = [BookWordViewModel]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
                UIView.animate(withDuration: 0.3, animations: {
                    self?.view.viewWithTag(1)?.alpha = 0.0
                }, completion: { _ in
                    self?.view.viewWithTag(1)?.removeFromSuperview()
                })
            }
        }
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - UIViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupActivityIndicatorView()
        setupNavigationController()
        setupTableView()
        setupViewModel()
    }
    
    private func setupActivityIndicatorView() {
        let activityIndicatorViewContainerView: UIView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
        activityIndicatorViewContainerView.tag = 1
        activityIndicatorViewContainerView.layer.cornerRadius = 8.0
        activityIndicatorViewContainerView.clipsToBounds = true
        
        tableView.addSubview(activityIndicatorViewContainerView)
        
        activityIndicatorViewContainerView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorViewContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicatorViewContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicatorViewContainerView.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        activityIndicatorViewContainerView.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        
        let activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicatorView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        activityIndicatorView.startAnimating()
        
        activityIndicatorViewContainerView.addSubview(activityIndicatorView)
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.topAnchor.constraint(equalTo: activityIndicatorViewContainerView.topAnchor).isActive = true
        activityIndicatorView.leadingAnchor.constraint(equalTo: activityIndicatorViewContainerView.leadingAnchor).isActive = true
        activityIndicatorView.trailingAnchor.constraint(equalTo: activityIndicatorViewContainerView.trailingAnchor).isActive = true
        activityIndicatorView.bottomAnchor.constraint(equalTo: activityIndicatorViewContainerView.bottomAnchor).isActive = true
        activityIndicatorViewContainerView.applyBlur()
    }
    
    private func setupNavigationController() {
        title = "Book words"
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "BookWordCell", bundle: Bundle.main), forCellReuseIdentifier: "BookWordCell")
    }
    
    private func setupViewModel() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else {
                return
            }
            
            do {
                self.viewModel = try self.libraryBookViewModel.getBookWords().map({
                    return BookWordViewModel(bookWord: $0)
                })
            } catch {
                self.coordinator?.presentErrorAlertController(withError: error)
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension BookWordsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BookWordCell = tableView.dequeueReusableCell(withIdentifier: "BookWordCell", for: indexPath) as! BookWordCell
        
        cell.viewModel = viewModel[indexPath.row]
        
        return cell
    }
}
