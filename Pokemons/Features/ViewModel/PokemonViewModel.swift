//
//  PokemonViewModel.swift
//  Pokemons
//
//  Created by ozlem on 28.04.2023.
//

import Foundation


protocol PokemonViewModelProtocol{
    func fetchItems()
    func changeLoading()
    
    var pokemonCharacters: [Result]{get set}
    var pokemonService: PokemonServiceProtocol{get}
    
    var pokemonOutPut: PokemonOutPut? {get}
    func setDelegate(output: PokemonOutPut)
    
}

final class PokemonViewModel: PokemonViewModelProtocol {
    var pokemonOutPut: PokemonOutPut?
    
    func setDelegate(output: PokemonOutPut) {
        pokemonOutPut = output
    }
    
    var pokemonCharacters: [Result] = []
    var pokemonService: PokemonServiceProtocol
    private var isLoading = false
    
    init() {
        pokemonService = PokemonService()
    }
    
    func fetchItems() {
        changeLoading()
        pokemonService.fetchAllDatas { response in
            self.changeLoading()
            self.pokemonCharacters = response ?? []
            self.pokemonOutPut?.saveData(values: self.pokemonCharacters )
            
        }
    }
    
    func changeLoading() {
      isLoading = !isLoading
        pokemonOutPut?.changeLoading(isLoad: isLoading)
    }
    
  
    
   
    
}
