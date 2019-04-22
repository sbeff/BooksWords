//
//  LibraryBookViewController.swift
//  BooksWords
//
//  Created by Emanuele Beffa on 20/04/2019.
//  Copyright © 2019 Emanuele Beffa. All rights reserved.
//

import UIKit

final class LibraryBookViewController: UIViewController, Storyboarded {
    
    // MARK: - Coordinator
    
    weak var coordinator: MainCoordinator?
    
    // MARK: - IBOutlets
    
    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: - ViewModel
    
    var viewModel: [LibraryBookViewModel] = BookHelper.getLibraryBookViewModel()
    
    // MARK: - UIViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupNavigationBar()
        setupCollectionView()
    }
    
    private func setupNavigationBar() {
        title = "Library book"
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 8.0, right: 8.0)
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "BookCell", bundle: Bundle.main), forCellWithReuseIdentifier: "BookCell")
    }
}

// MARK: - UICollectionViewDataSource

extension LibraryBookViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BookCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as! BookCell
        
        cell.viewModel = viewModel[indexPath.row]
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension LibraryBookViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.openBookWords(withLibraryBook: viewModel[indexPath.row])
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension LibraryBookViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor((collectionView.bounds.width / 2.0) - 8.0)
        return CGSize(width: width, height: width * 1.5)
    }
}
