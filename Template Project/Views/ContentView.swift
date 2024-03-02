//
//  ContentView.swift
//  Template Project
//
//  Created by John Pill on 25/01/2024.
//

import SwiftUI
import SwiftData            // Import SwiftData on all files.


struct ContentView: View {
    
    @Environment(\.modelContext) private var context    // Access the modelContext from the app file.
    
    // MARK: Return data from the 'database' to use in our app. 
        // Its called 'books' and is an array of Book structs.
        // You can change the sort method (or not have one) and also create different queries.
    @Query(sort: \Book.rating, order: .reverse) private var books: [Book]
    
    
    // MARK: These are just used to store your input control values until commited to persistent data.
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 1.0
    @State private var review = ""
    @State private var favorite = false
    @State private var finishedReading = false
    @State private var selectedImage: Data?
    @State private var addBookReviewSheet = false
    @State private var image: Data?
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                // MARK: List to display persisted data from the 'books' query which is an array of Book.
                List {
                    ForEach(books) { book in
                        NavigationLink(destination: DetailView(book: book)) {
                            
                        // MARK: check out the ListItem.swift file this displays each book.
                            ListItem(book: book)
                   
                        }
                    }
                    .onDelete { indexes in
                        for index in indexes {
                            deleteBook(books[index])
                        }
                    }
                }
            }
            .navigationTitle("🌍 Book Review")
            
            // MARK: Button to pull up the sheet to add a book.
            // I have used .overlay to make it look like its floating on top of the screen.
            
            .overlay(
                Button {
                    addBookReviewSheet = true
                } label: {
                    Image(systemName: "square.and.pencil.circle.fill")
                        .font(.system(size: 56))
                        .padding(.trailing, 15)
                        .padding(.bottom, -10)
                },
                alignment: .bottomTrailing)
            
            
            // MARK: The sheet with input fields to enter a book review.
            .sheet(isPresented: $addBookReviewSheet) {
                
                VStack {
                    // MARK: Check out this AddItemForm.swift file we bind the variables from this view to the AddOItemForm view so that if we change the variables in that view, we change them here.
                    AddItemForm(title: $title, author: $author, rating: $rating, favorite: $favorite, finishedReading: $finishedReading, review: $review)
                    
                        Button {
                            addBook() // Calls this function - review it below.
                        } label: {
                            Text("Done")
                                .fontWeight(.heavy)
                                .padding(12)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .padding(10)
                        }
                    }
                }
            }
        }
    
    
    // MARK: This function creates a Book from the input fields and then inserts it in the 'database'.
    func addBook() {
        let bookReview = Book(title: title, author: author, rating: Int(rating), review: review, favorite: favorite, finsihedReading: finishedReading, image: image)
        context.insert(bookReview)
        addBookReviewSheet = false  // Do this to close the sheet.
        emptyFields()               // Clears the input fields.
    }
    
    
    // MARK: This function detelets a Book that is passed to it.
    func deleteBook(_ bookReview: Book) {
        context.delete(bookReview)
    }
    
    
    // MARK: This function clears all our input fields when we are done.
    func emptyFields() {
        title = ""
        author = ""
        rating = 0.0
        review = ""
        favorite = false
        finishedReading = false
    }
    
}




// MARK: This creates our preview - do not remove / change this. However you might prefer to run in the simulator with CMD + R.

#Preview {
    ContentView()
        .modelContainer(for: Book.self, inMemory: true)
    
}
