//
//  DetailViewController.swift
//  Pokemons
//
//  Created by ozlem on 27.03.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var abilitiesLabel: UILabel!

    var pokemonDetailViewModel : PokemonDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PokemonDetail"
        fetchPokemonDetail()
        nameLabel.text = pokemonDetailViewModel.name
        
if let imageURL = URL(string: pokemonDetailViewModel.imageURLString) {
    URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
        guard let data = data else { return }
        DispatchQueue.main.async {
            self.imageView.image = UIImage(data: data)
        }
    }.resume()
}
}

    private func fetchPokemonDetail() {
        pokemonDetailViewModel.fetchPokemonDetail {
            DispatchQueue.main.async {
                self.abilitiesLabel.text = self.pokemonDetailViewModel.abilities.joined(separator: ", ")
            }
        }
    }
}
