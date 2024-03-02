//
//  StarView.swift
//  Template Project
//
//  Created by John Pill on 29/02/2024.
//

import SwiftUI

struct StarView: View {
    @State var stars: Int
    
    var body: some View {
        HStack {
            ForEach(0..<stars, id: \.self) {_ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
            ForEach(0..<(5 - stars), id: \.self) {_ in
                Image(systemName: "star")
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
    }
}

