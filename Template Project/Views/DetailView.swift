//
//  DetailView.swift
//  Template Project
//
//  Created by John Pill on 29/02/2024.
//

import Foundation
import SwiftUI
import SwiftData


// MARK: Detail View - using @Bindable. If we then bind to this var with $ data properties are auto updated in the modelContext / persistent data.


struct DetailView: View {
    @Bindable var book: Book
    
    var body: some View {
        NavigationStack {
            VStack {
                                
                Form {
                    TextField("Title", text: $book.title)
                    TextField("Author", text: $book.author)
                    Toggle("Favourite", isOn: $book.favorite)
                    Toggle("Finished", isOn: $book.finsihedReading)
                    StarView(stars: book.rating)
                }
                
                VStack {
                    TextEditor(text: $book.review)
                        .cornerRadius(10)
                        .padding()
                        .shadow(color: .secondary, radius: 5)
                }
            }
        }
    }
}



