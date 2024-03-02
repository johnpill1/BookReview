//
//  Template_ProjectApp.swift
//  Template Project
//
//  Created by John Pill on 25/01/2024.
//

import SwiftUI
import SwiftData

@main
struct Template_ProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
        .modelContainer(for: Book.self)         // MARK: This sets up the container for your data across the app.

        
    }
}
