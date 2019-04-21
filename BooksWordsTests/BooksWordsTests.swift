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
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testLibraryBookViewModel() {
        let libraryBookViewModel: LibraryBookViewModel = LibraryBookViewModel(book: Book(title: "The Old Man and the Sea", author: "Ernest Hemingway", fileName: "TheOldManAndTheSea"))
        
        XCTAssertEqual(libraryBookViewModel.title, "The Old Man and the Sea")
        XCTAssertEqual(libraryBookViewModel.author, "Ernest Hemingway")
    }
}
