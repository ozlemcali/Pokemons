//
//  Pokemon.swift
//  Pokemons
//
//  Created by ozlem on 26.03.2023.
//

import Foundation


struct Pokemon : Codable{
    let results : [PokemonResult]
    
}

struct PokemonResult : Codable{
    let name : String
    let url : String
}


