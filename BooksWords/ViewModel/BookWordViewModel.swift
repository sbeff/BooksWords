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
    
    var occurrencesIsPrimeNumber: Bool {
        get {
            if occurrences <= 3 {
                return true
            }
            
            if occurrences.isMultiple(of: 2) {
                return false
            }
            
            var i: Int = 2
            
            while i * i <= occurrences {
                if occurrences.isMultiple(of: i) {
                    return false
                }
                
                i += 1
            }
            
            return true
        }
    }
    
    init(bookWord: BookWord) {
        self.bookWord = bookWord
    }
}
