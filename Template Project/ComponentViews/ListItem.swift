//
//  ListItem.swift
//  Template Project
//
//  Created by John Pill on 02/03/2024.
//

import SwiftUI

struct ListItem: View {
    @State var book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(book.title).font(.headline)
                Spacer()
                Image(systemName: book.finsihedReading ? "checkmark.circle.fill" : "checkmark.circle")
                    .foregroundColor(book.finsihedReading ? .green : .gray)
                Image(systemName: book.favorite ? "heart.fill" : "heart")
                    .foregroundColor(book.favorite ? .red : .gray)
            }
            
            Text(book.author)
                .font(.caption).fontWeight(.bold)
                .padding(.bottom, 4)
            Text(book.review)
                .italic()
                .font(.system(size: 12))
            
            StarView(stars: book.rating) // Check out the StarView.swift file.
            
        }
    }
}


