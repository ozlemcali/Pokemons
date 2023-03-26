//
//  PokemonViewModel.swift
//  Pokemons
//
//  Created by ozlem on 26.03.2023.
//

import Foundation
import UIKit


struct  PokemonListViewModel{
    
    let pokemonList = [PokemonResult] ()
    
    func numberOfRowsInSection()-> Int{
        return self.pokemonList.count
    }
    
    func pokemonAtIndex(_ index : Int) -> PokemonViewModel{
        let pokemon = self.pokemonList[index]
        return PokemonViewModel(pokemon: pokemon)
    }
    
}



struct PokemonViewModel{
    
    var pokemon : PokemonResult!
    
    var name : String{
        return self.pokemon.name.capitalized
    }
   
    
}
