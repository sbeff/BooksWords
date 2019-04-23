![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat) ![iOS](https://img.shields.io/badge/platform-iOS-%23989898.svg?color=blue) ![MIT license](https://img.shields.io/cocoapods/l/Tags.svg?style=flat&color=brightgreen)

# BooksWords
This app lets you know how many times a word is contained in a book in the book library section or in a book downloaded from the web. I developed the app using the [TDD approach](https://en.wikipedia.org/wiki/Test-driven_development), implementing the [MVVM pattern](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel) and the [Coordinator pattern](http://khanlou.com/2015/10/coordinators-redux/).

## Methodologies
Initially I implemented the MVC pattern, but during the development of the tests I realized that it would be better to use the MVVM pattern.
I created an offline book library containing four books from [gutenberg.org](https://www.gutenberg.org/) and I opened them using the utf8 encoding, setting the isoLatin1 encoding as fallback.
To calculate the number of occurrences of a word, I first transformed the text of the book into a String array, then I grouped these words into a [String: Int] dictionary, sorting it by the number of occurrences and alphabetically by the word, then I improved this algorithm using [Swift's lazy collections](https://developer.apple.com/documentation/swift/lazycollection), achieving a 10% performance increase.
The disadvantage of this algorithm consists in cyclically sequentially every word of the book, but the results are good (~0.069 seconds for an array of 2500 elements). Obviously, in order not to have to wait for this fraction of time while opening a book, the algorithm was executed on a background queue, without affecting the UI performance.
