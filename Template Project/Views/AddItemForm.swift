//
//  AddItemForm.swift
//  Template Project
//
//  Created by John Pill on 02/03/2024.
//

import SwiftUI

struct AddItemForm: View {
    
    @Binding var title: String
    @Binding var author: String
    @Binding var rating: Double
    @Binding var favorite: Bool
    @Binding var finishedReading: Bool
    @Binding var review: String
    
    var body: some View {
        VStack {
            Form {
                
                TextField("Title", text: $title)
                TextField("Author", text: $author)
                
                HStack {
                    Slider(value: $rating, in: 1...5, step: 1)
                    HStack {
                        ForEach(0..<Int(rating), id: \.self) {_ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        
                        ForEach(0..<(5 - Int(rating)), id: \.self) {_ in
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                    }
                }
                Toggle("Favourite", isOn: $favorite)
                Toggle("Finished", isOn: $finishedReading)
            }
            
            VStack {
                TextEditor(text: $review)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .secondary, radius: 5)
            }
        }
    }
}

