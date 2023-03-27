//
//  PokemonDetail.swift
//  Pokemons
//
//  Created by ozlem on 27.03.2023.
//

import Foundation

struct PokemonDetailModel : Codable{
    let name : String
    let abilities :[AbilitiyModel]
  
}


struct AbilitiyModel :Codable{
    let ability : AbilityDetailModel
   
}


struct AbilityDetailModel : Codable{
    let name : String
}
