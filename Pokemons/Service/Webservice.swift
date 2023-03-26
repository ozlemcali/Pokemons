//
//  Webservice.swift
//  Pokemons
//
//  Created by ozlem on 26.03.2023.
//

import Foundation


class Webservice{
    
    
    var pokemon = [PokemonResult]()
    
    func downloadPokemons(page: Int, comp: @escaping ([PokemonResult]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20&offset=\(page)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            else if let data = data {
                
                let pokemonList = try? JSONDecoder().decode(Pokemon.self, from: data)
                print(pokemonList ?? "error!")
                
                if pokemonList != nil{
                    
                    
                    
                }
                
            }
            
        }.resume()
        
        
    }
}
            
            
            /*
            guard let data = data else { return }
            
            var result: Pokemon?
            do {
                result = try JSONDecoder().decode(Pokemon.self, from: data)
                print(result ?? "error")
            }
            catch {
                print("error")
            }
            
          
            
        }.resume()
        
        
        
    }}
*/

        /*
        
        func downloadPokemons(url : URL, completion: @escaping ([PokemonResult]?)-> ()){
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error{
                    print(error.localizedDescription)
                    completion(nil)
                    
                }else if let data = data {
                    
                    let pokemonList = try? JSONDecoder().decode([Pokemon].self, from: data)
                    print(pokemonList ?? "error!")
                    
                    if pokemonList != nil{
                        
                       
                     
                    }
                    
                }
        
            }.resume()
            
            
        }
        */
        
