//
//  HeroesCell.swift
//  StarWarsApi
//
//  Created by  BoDim on 07.03.2022.
//

import Foundation

protocol HeroesCellViewModelProtocol {
    var heroName: String { get }
    init(heroes: Heroes)
}

class HeroesCellViewModel: HeroesCellViewModelProtocol {
    var heroName: String {
        heroes.name ?? ""
    }
    
    private let heroes: Heroes
    
    required init(heroes: Heroes) {
        self.heroes = heroes
    }
    
    
}


