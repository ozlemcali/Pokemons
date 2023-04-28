//
//  Pokemon.swift
//  Pokemons
//
//  Created by ozlem on 26.03.2023.
//

import Foundation


import Foundation

// MARK: - Welcome
struct PostModel: Codable {
    let count: Int
    let next: String
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let name: String
    let url: String
}
