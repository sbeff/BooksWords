//
//  BooksWordsTests.swift
//  BooksWordsTests
//
//  Created by Emanuele Beffa on 20/04/2019.
//  Copyright © 2019 Emanuele Beffa. All rights reserved.
//

import XCTest
@testable import BooksWords

class BooksWordsTests: XCTestCase {
    
    // MARK: - Variables
    
    let bookWordViewModel: BookWordViewModel = BookWordViewModel(bookWord: BookWord(word: "the", occurrences: 2338))
    
    let libraryBookViewModel: LibraryBookViewModel = LibraryBookViewModel(book: Book(title: "The Old Man and the Sea", author: "Ernest Hemingway", fileName: "TheOldManAndTheSea"))
    
    // MARK: - Tests
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testLibraryBookViewModel() {
        XCTAssertEqual(libraryBookViewModel.title, "The Old Man and the Sea")
        XCTAssertEqual(libraryBookViewModel.author, "Ernest Hemingway")
    }
    
    func testBookWordViewModel() {
        XCTAssertEqual(bookWordViewModel.word, "the")
        XCTAssertEqual(bookWordViewModel.occurrences, 2338)
    }
    
    func testLibraryBookGetStatistics() {
        measure {
            do {
                let bookWordViewModels: [BookWordViewModel] = try libraryBookViewModel.getBookWords().map({
                    return BookWordViewModel(bookWord: $0)
                })
                
                XCTAssertEqual(bookWordViewModels.count, 2555)
                
                XCTAssertEqual(bookWordViewModels.first?.word, "the")
                XCTAssertEqual(bookWordViewModels.first?.occurrences, 2338)
                
                XCTAssertEqual(bookWordViewModels.last?.word, "yours")
                XCTAssertEqual(bookWordViewModels.last?.occurrences, 1)
            } catch {
                XCTFail()
            }
        }
    }
}
