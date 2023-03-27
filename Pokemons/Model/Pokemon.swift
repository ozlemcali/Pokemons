//
//  Pokemon.swift
//  Pokemons
//
//  Created by ozlem on 26.03.2023.
//

import Foundation


struct Pokemon: Codable{
    let name : String
    let url: String
    
    var imageUrl : String {
        let id = url.split(separator: "/").dropLast().last!
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"    }
}


struct PokemonList : Codable{
    let results : [Pokemon]
}
