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
    
    func getBookWords() throws -> [BookWord] {
        var text: String! = try? String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
        
        if text == nil {
            text = try String(contentsOf: fileUrl, encoding: String.Encoding.isoLatin1)
        }
        
        var toReturn = [String: Int]()
        
        text.getWordsArray().forEach { word in
            if let i = toReturn[word] {
                toReturn[word] = i + 1
            } else {
                toReturn[word] = 1
            }
        }
        
        return toReturn.sorted(by: {
            return ($0.1, $1.0) > ($1.1, $0.0)
        }).map({
            return BookWord(word: $0.key, occurrences: $0.value)
        })
    }
    
    init(book: Book) {
        self.book = book
    }
}