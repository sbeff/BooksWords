//
//  BookWordViewModel.swift
//  BooksWords
//
//  Created by Emanuele Beffa on 22/04/2019.
//  Copyright © 2019 Emanuele Beffa. All rights reserved.
//

import Foundation

struct BookWordViewModel {
    private let bookWord: BookWord!
    
    var word: String {
        get {
            return bookWord.word
        }
    }
    
    var occurrences: Int {
        get {
            return bookWord.occurrences
        }
    }
    
    init(bookWord: BookWord) {
        self.bookWord = bookWord
    }
}
