//
//  PokemonViewModel.swift
//  Pokemons
//
//  Created by ozlem on 26.03.2023.
//

import Foundation
import UIKit


class PokemonViewModel {

    var pokemonArray = [Pokemon] ()
    
    func fetchPokemon(completion : @escaping() -> ()){
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20&offset=0") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            
            if let data = data{
                do{
                    let decoder = JSONDecoder()
                    let pokemonData = try decoder.decode(PokemonList.self, from:data)
                    self.pokemonArray = pokemonData.results
                    completion()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
        
        
    }
    
    
}

