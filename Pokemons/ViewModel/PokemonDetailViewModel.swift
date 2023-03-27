//
//  PokemonDetailViewModel.swift
//  Pokemons
//
//  Created by ozlem on 28.03.2023.
//

import Foundation
import UIKit


class PokemonDetailViewModel{
    
    let pokemon : Pokemon
    var pokemonDetail :PokemonDetailModel?
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
   
    
    func fetchPokemonDetail(completion : @escaping()-> ()){
        guard let url = URL(string: pokemon.url) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {return}
            
            do{
                let decoder = JSONDecoder()
                
                self.pokemonDetail = try decoder.decode(PokemonDetailModel.self, from: data)
                completion()
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
}

extension PokemonDetailViewModel{
    var name : String{
        return pokemon.name
    }
    
    var abilities: [String] {
        return pokemonDetail?.abilities.map({ $0.ability.name }) ?? []
    }
    
    var imageURLString: String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(getImageID(from: pokemon.url)).png"
    }
    
    private func getImageID(from url: String) -> String {
        let components = url.components(separatedBy: "/")
        return components[components.count-2]
    }
}
