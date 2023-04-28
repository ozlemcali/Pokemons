//
//  PokemonServiceEndPoint.swift
//  Pokemons
//
//  Created by ozlem on 28.04.2023.
//

import Alamofire

enum PokemonServiceEndPoint: String{
    case BASE_URL = "https://pokeapi.co/api/v2"
    case PATH = "/pokemon"
    
    static func characterPath()->String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}


protocol PokemonServiceProtocol {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void)
}

struct PokemonService: PokemonServiceProtocol {
    func fetchAllDatas(response: @escaping ([Result]?)-> Void){
        AF.request(PokemonServiceEndPoint.characterPath()).responseDecodable(of: PostModel.self) { model in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }
    
    
}

