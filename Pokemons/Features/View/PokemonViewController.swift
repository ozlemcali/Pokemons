//
//  PokemonViewController.swift
//  Pokemons
//
//  Created by ozlem on 28.04.2023.
//

import UIKit
import SnapKit


protocol PokemonOutPut {
    func changeLoading(isLoad: Bool)
    func saveData(values: [Result])
}


final class PokemonViewController: UIViewController {

    private let labelTitle: UILabel = UILabel()
    private let tableView: UITableView = UITableView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
 
    private lazy var results: [Result] = []
    lazy var viewModel: PokemonViewModelProtocol = PokemonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.setDelegate(output: self)
        viewModel.fetchItems()
        
    }
    
    private func configure(){
        view.addSubview(labelTitle)
        view.addSubview(tableView)
        view.addSubview(indicator)
        view.backgroundColor = .white
        tableView.backgroundColor = .red
        drawDesign()
        makeLabel()
        makeIndicator()
        makeTableView()
        
    }
    private func drawDesign() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: PokemonTableViewCell.Identifier.custom.rawValue)
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.labelTitle.font = .boldSystemFont(ofSize: 25)
            self.labelTitle.text = "Pokemon"
            self.indicator.color = .red
        }
        indicator.startAnimating()
    }
    
}
extension PokemonViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell: PokemonTableViewCell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.Identifier.custom.rawValue) as? PokemonTableViewCell else {
          return  UITableViewCell()
        }
        cell.saveData(model: results[indexPath.row])
        return cell
    }
    
    
}

extension PokemonViewController: PokemonOutPut {
    func changeLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveData(values: [Result]) {
        results = values
        tableView.reloadData()
    }
    
    
}




extension PokemonViewController {
    private func makeTableView() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.left.right.equalTo(labelTitle)
            make.bottom.equalToSuperview()
        }
    }

    
    func makeLabel() {
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.right.equalTo(view).offset(-10)
            make.left.equalTo(view).offset(10)
            make.height.greaterThanOrEqualTo(10)
        }
    }

    func makeIndicator() {
        indicator.snp.makeConstraints { (make) in
            make.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
    }}
