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
    
    let urlLibraryBookViewModel: LibraryBookViewModel = LibraryBookViewModel(book: Book(title: "", author: "", fileName: "https://www.gutenberg.org/cache/epub/1080/pg1080.txt"))
    
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
        XCTAssertEqual(bookWordViewModel.occurrencesIsPrimeNumber, false)
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
                XCTAssertEqual(bookWordViewModels.first?.occurrencesIsPrimeNumber, false)
                
                XCTAssertEqual(bookWordViewModels.last?.word, "yours")
                XCTAssertEqual(bookWordViewModels.last?.occurrences, 1)
                XCTAssertEqual(bookWordViewModels.last?.occurrencesIsPrimeNumber, true)
            } catch {
                XCTFail()
            }
        }
    }
    
    func testLibraryBookGetStatisticsWorseAlternative() {
        measure {
            do {
                let bookWordViewModels: [BookWordViewModel] = try libraryBookViewModel.getBookWordsWorseAlternative().map({
                    return BookWordViewModel(bookWord: $0)
                })
                
                XCTAssertEqual(bookWordViewModels.count, 2555)
                
                XCTAssertEqual(bookWordViewModels.first?.word, "the")
                XCTAssertEqual(bookWordViewModels.first?.occurrences, 2338)
                XCTAssertEqual(bookWordViewModels.first?.occurrencesIsPrimeNumber, false)
                
                XCTAssertEqual(bookWordViewModels.last?.word, "yours")
                XCTAssertEqual(bookWordViewModels.last?.occurrences, 1)
                XCTAssertEqual(bookWordViewModels.last?.occurrencesIsPrimeNumber, true)
            } catch {
                XCTFail()
            }
        }
    }
    
    func testOpenAnURL() {
        do {
            let bookWordViewModels: [BookWordViewModel] = try urlLibraryBookViewModel.getBookWords().map({
                return BookWordViewModel(bookWord: $0)
            })
            
            XCTAssertEqual(bookWordViewModels.count, 1618)
            
            XCTAssertEqual(bookWordViewModels.first?.word, "the")
            XCTAssertEqual(bookWordViewModels.first?.occurrences, 347)
            XCTAssertEqual(bookWordViewModels.first?.occurrencesIsPrimeNumber, true)
            
            XCTAssertEqual(bookWordViewModels.last?.word, "zip")
            XCTAssertEqual(bookWordViewModels.last?.occurrences, 1)
            XCTAssertEqual(bookWordViewModels.last?.occurrencesIsPrimeNumber, true)
        } catch {
            XCTFail()
        }
    }
}
