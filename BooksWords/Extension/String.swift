//
//  String.swift
//  BooksWords
//
//  Created by Emanuele Beffa on 22/04/2019.
//  Copyright © 2019 Emanuele Beffa. All rights reserved.
//

import Foundation

extension String {
    func getWordsArray() -> [String] {
        return components(separatedBy: CharacterSet.alphanumerics.inverted).lazy.map({
            return $0.lowercased()
        }).lazy.filter {
            return !$0.isEmpty
        }
    }
}
