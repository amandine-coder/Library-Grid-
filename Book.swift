//
//  Book.swift
//  LibraryGridV2
//
//  Created by Amandine on 13/04/26.
//
import SwiftUI

struct Book: Identifiable {
    let id = UUID()
    let title: String
    let source: String
    let datePublished: String
    let notes: String
    let tags: [String]
    let color: Color
}
