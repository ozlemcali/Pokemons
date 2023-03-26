//
//  ViewController.swift
//  Pokemons
//
//  Created by ozlem on 26.03.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
 

    @IBOutlet weak var tableView: UITableView!
    private var pokemonListViewModel = PokemonListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
    }
    
    
    
    func getData(){
        Webservice().downloadPokemons(page: 0){ (pokemons) in
            
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }     
                   }
               }
               
        
           
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemonListViewModel == nil ? 0 : self.pokemonListViewModel.numberOfRowsInSection()
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonTableViewCell
        
       let pokemonViewModel = self.pokemonListViewModel.pokemonAtIndex(indexPath.row)
       cell.pokemonName.text = pokemonViewModel.name
        
       return cell
    }




}
