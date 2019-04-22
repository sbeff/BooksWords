//
//  BookWordCell.swift
//  BooksWords
//
//  Created by Emanuele Beffa on 22/04/2019.
//  Copyright © 2019 Emanuele Beffa. All rights reserved.
//

import UIKit

class BookWordCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var cardView: UIView!
    
    @IBOutlet private var wordLabel: UILabel!
    
    @IBOutlet private var occurrencesLabel: UILabel!
    
    // MARK: - ViewModel
    
    var viewModel: BookWordViewModel! {
        didSet {
            wordLabel.text = viewModel.word
            occurrencesLabel.text = "\(viewModel.occurrences) - \(viewModel.occurrencesIsPrimeNumber ? "Prime" : "Not prime")"
        }
    }
    
    // MARK: - UIView lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        cardView.layer.cornerRadius = 8.0
        cardView.clipsToBounds = true
        cardView.applyBlur()
    }
}
