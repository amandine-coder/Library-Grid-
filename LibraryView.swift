//
//  LibraryView.swift
//  LibraryGridV2
//
//  Created by Amandine on 13/04/26.
//
import SwiftUI

struct LibraryView: View {
    @State private var books: [Book] = []
    @State private var showAddBook = false
    
    var leftBooks: [Book] {
        books.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }
    }
    
    var rightBooks: [Book] {
        books.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }
    }
    
    var body: some View {
        
            
            NavigationStack {
                ZStack {
                    Color(hex: "F5F0E8")
                        .ignoresSafeArea()
                ScrollView {
                    if books.isEmpty {
                        Text("Appuie sur + pour ajouter un livre")
                            .foregroundColor(.gray)
                            .padding(.top, 100)
                    } else {
                        HStack(alignment: .top, spacing: 12) {
                            VStack(spacing: 12) {
                                ForEach(leftBooks) { book in
                                    NavigationLink(destination: BookDetailView(book: book)) {
                                        BookCard(book: book)
                                    }
                                }
                            }
                            VStack(spacing: 12) {
                                ForEach(rightBooks) { book in
                                    NavigationLink(destination: BookDetailView(book: book)) {
                                        BookCard(book: book)
                                    }
                                }
                            }
                        }
                        .padding()
                       
                    }
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Library")
                .toolbar {
                    Button {
                        showAddBook = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showAddBook) {
                    AddBookView(books: $books)
                }
                .toolbarBackground(Color(hex: "F5F0E8"), for: .navigationBar)
            }
        }
    }
}

#Preview {
    LibraryView()
}
