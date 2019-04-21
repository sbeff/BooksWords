//
//  BookHelper.swift
//  BooksWords
//
//  Created by Emanuele Beffa on 21/04/2019.
//  Copyright © 2019 Emanuele Beffa. All rights reserved.
//

import Foundation

struct BookHelper {
    static var books: [Book] {
        return [
            Book(title: "The Old Man and the Sea", author: "Ernest Hemingway", fileName: "TheOldManAndTheSea"),
            Book(title: "Frankenstein", author: "Mary Wollstonecraft Shelley", fileName: "Frankenstein"),
            Book(title: "Pride and Prejudice", author: "Jane Austen", fileName: "PrideAndPrejudice"),
            Book(title: "A Tale of Two Cities", author: "Charles Dickens", fileName: "ATaleOfTwoCities")
        ]
    }
    
    static func getLibraryBookViewModel() -> [LibraryBookViewModel] {
        return books.map({
            return LibraryBookViewModel(book: $0)
        })
    }
}
