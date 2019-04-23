//
//  Dictionary.swift
//  BooksWords
//
//  Created by Emanuele Beffa on 23/04/2019.
//  Copyright © 2019 Emanuele Beffa. All rights reserved.
//

import Foundation

extension Dictionary {
    public init(keys: [Key], values: [Value]) {
        precondition(keys.count == values.count)
        
        self.init()
        
        for (index, key) in keys.enumerated() {
            self[key] = values[index]
        }
    }
}
