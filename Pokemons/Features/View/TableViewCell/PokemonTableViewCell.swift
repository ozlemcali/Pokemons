//
//  PokemonTableViewCell.swift
//  Pokemons
//
//  Created by ozlem on 28.04.2023.
//

import UIKit
import AlamofireImage

class PokemonTableViewCell: UITableViewCell {
    

    private let title: UILabel = UILabel()
    enum Identifier: String {
        case custom = "ozlem"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    private func configure() {
        addSubview(title)
        title.font = .boldSystemFont(ofSize: 18)
       
        title.snp.makeConstraints { (make) in
            make.right.left.equalTo(contentView)
        }
    }
    
    func saveData(model: Result){
        title.text = model.name

    }
    
}
