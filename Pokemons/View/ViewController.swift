//
//  ViewController.swift
//  Pokemons
//
//  Created by ozlem on 26.03.2023.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = PokemonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        title = "Pokemons"
        
        viewModel.fetchPokemon {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonTableViewCell
        
       let pokemon = viewModel.pokemonArray[indexPath.row]
        cell.pokemonName.text = pokemon.name
        
        if let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(indexPath.row+1).png") {
                    URLSession.shared.dataTask(with: url) { data, response, error in
                        if let data = data {
                            DispatchQueue.main.async {
                                cell.pokemonImage.image = UIImage(data: data)
                                cell.setNeedsLayout()
                            }
                        }
                    }.resume()
                }

                return cell
            }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = viewModel.pokemonArray[indexPath.row]
        
        
        let detailVC = storyboard?.instantiateViewController(identifier: "toDetailVC") as! DetailViewController
            let detailViewModel = PokemonDetailViewModel(pokemon: pokemon)
               detailVC.pokemonDetailViewModel = detailViewModel
                navigationController?.pushViewController(detailVC, animated: true)
            }
        }
        

