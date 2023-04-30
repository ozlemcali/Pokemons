//
//  WebService.swift
//  PokemonSwiftUI
//
//  Created by ozlem on 29.04.2023.
//

import Foundation
 
class WebService {
        func getPokemon() -> [Pokemon] {
            let data: PokemonPage = Bundle.main.decode(file:"pokemon.json")
            let pokemon: [Pokemon] = data.results
            
            return pokemon
        }
        
        func getDetailedPokemon(id: Int, _ completion:@escaping (DetailPokemon) -> ()) {
            Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: DetailPokemon.self) { data in
                completion(data)
                print(data)
                
            } failure: { error in
                print(error)
            }
        }
    }







