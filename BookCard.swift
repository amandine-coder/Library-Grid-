//
//  BookCard.swift
//  LibraryGridV2
//
//  Created by Amandine on 13/04/26.
//
import SwiftUI

struct BookCard: View {
    let book: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            Text(book.title)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.white)
                .fixedSize(horizontal: false, vertical: true)
            Text(book.datePublished)
                .font(.system(size: 11))
                .foregroundColor(.white.opacity(0.7))
        }
        .padding(12)
        .frame(maxWidth: .infinity, minHeight: 120, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(book.color)
        )
    }
}
