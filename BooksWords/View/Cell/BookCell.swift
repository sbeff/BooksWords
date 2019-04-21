//
//  BookCell.swift
//  BooksWords
//
//  Created by Emanuele Beffa on 20/04/2019.
//  Copyright © 2019 Emanuele Beffa. All rights reserved.
//

import UIKit

final class BookCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var bookView: UIView!
    
    @IBOutlet private var titleLabel: UILabel!
    
    @IBOutlet private var authorLabel: UILabel!
    
    // MARK: - ViewModel
    
    var viewModel: LibraryBookViewModel! {
        didSet {
            titleLabel.text = viewModel.title
            authorLabel.text = viewModel.author
        }
    }
    
    // MARK: - UIView lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bookView.layer.cornerRadius = 2.0
        bookView.clipsToBounds = true
    }
}
