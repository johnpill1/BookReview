//
//  Data Model.swift
//  Template Project
//
//  Created by John Pill on 25/01/2024.
//

import Foundation
import SwiftData                    // Import the framework


// MARK: This class acts as a blueprint for what a book review will be. We call it a 'Book' throughout the app.

@Model                              // Add this
final class Book {                      // make it a class
    var id = UUID()
    var title: String
    var author: String
    var rating: Int
    var review: String
    var favorite = false
    var finsihedReading = false
    var image: Data?
    var timestamp = Date.now
    
    init(id: UUID = UUID(), title: String, author: String, rating: Int, review: String, favorite: Bool = false, finsihedReading: Bool = false, image: Data? = nil, timestamp: Foundation.Date = Date.now) {
        self.id = id
        self.title = title
        self.author = author
        self.rating = rating
        self.review = review
        self.favorite = favorite
        self.finsihedReading = finsihedReading
        self.image = image
        self.timestamp = timestamp
    }
    
}
