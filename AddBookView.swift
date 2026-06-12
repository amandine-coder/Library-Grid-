//
//  AddBookView.swift
//  LibraryGridV2
//
//  Created by Amandine on 13/04/26.
//
import SwiftUI

struct AddBookView: View {
    @Binding var books: [Book]
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var source = ""
    @State private var datePublished = ""
    @State private var notes = ""
    @State private var tags = ""
    @State private var selectedColor: Color = .blue
    
    let colors: [Color] = [.yellow, .orange, .red, .brown, .blue, .green, .purple, .pink]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Titre") {
                    TextField("Nom du livre", text: $title)
                }
                
                Section("Source") {
                    TextField("Nom de la source", text: $source)
                }
                
                Section("Date Published") {
                    TextField("ex: March 11, 1861", text: $datePublished)
                }
                
                Section("Notes") {
                    TextEditor(text: $notes)
                        .frame(height: 80)
                }
                
                Section("Tags") {
                    TextField("ex: Meiji, Japan, History", text: $tags)
                }
                
                Section("Couleur") {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ForEach(colors, id: \.self) { color in
                            Circle()
                                .fill(color)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Circle()
                                        .stroke(Color.primary, lineWidth: selectedColor == color ? 3 : 0)
                                )
                                .onTapGesture {
                                    selectedColor = color
                                }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Nouveau livre")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Annuler") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Ajouter") {
                        let newBook = Book(
                            title: title,
                            source: source,
                            datePublished: datePublished,
                            notes: notes,
                            tags: tags.components(separatedBy: ", "),
                            color: selectedColor
                        )
                        books.append(newBook)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}
