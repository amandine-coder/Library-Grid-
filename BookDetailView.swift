//
//  BookDetailView.swift
//  LibraryGridV2
//
//  Created by Amandine on 13/04/26.
//
import SwiftUI

struct BookDetailView: View {
    let book: Book
    
    var body: some View {
        ZStack {
            Color(hex: "F5F0E8")
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Header coloré
                    RoundedRectangle(cornerRadius: 16)
                        .fill(book.color)
                        .frame(height: 200)
                        .overlay(
                            Text(book.title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                            , alignment: .bottomLeading
                        )
                    
                    // Infos
                    VStack(alignment: .leading, spacing: 16) {
                        infoRow(label: "Source", value: book.source)
                        infoRow(label: "Date Published", value: book.datePublished)
                        
                        if !book.notes.isEmpty {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Notes")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text(book.notes)
                                    .font(.body)
                            }
                        }
                        
                        if !book.tags.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Tags")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                FlowLayout(tags: book.tags)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func infoRow(label: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.body)
        }
    }
}
