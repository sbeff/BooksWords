//
//  LibraryBookViewModel.swift
//  BooksWords
//
//  Created by Emanuele Beffa on 21/04/2019.
//  Copyright © 2019 Emanuele Beffa. All rights reserved.
//

import Foundation

struct LibraryBookViewModel {
    private let book: Book
    
    var title: String {
        get {
            return book.title
        }
    }
    
    var author: String {
        get {
            return book.author
        }
    }
    
    var fileUrl: URL {
        get {
            guard let url = Bundle.main.url(forResource: book.fileName, withExtension: "txt") else {
                fatalError("The book \(book.fileName) does not exist.")
            }
            
            return url
        }
    }
    
    init(book: Book) {
        self.book = book
    }
}
