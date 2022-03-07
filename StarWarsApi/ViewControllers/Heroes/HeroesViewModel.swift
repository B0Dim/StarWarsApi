//
//  HeroesViewModel.swift
//  StarWarsApi
//
//  Created by  BoDim on 07.03.2022.
//

import Foundation

protocol HeroesViewModelProtocol {
    var heroes: [Heroes] { get }
    func fetchHeroes(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> HeroesCellViewModelProtocol
    func aboutViewModel(at indexPath: IndexPath) -> AboutViewModelProtocol
}

class HeroesViewModel: HeroesViewModelProtocol {
    var heroes: [Heroes] = []
    
    func fetchHeroes(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchDataHeroes { heroes in
            self.heroes = heroes
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        heroes.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> HeroesCellViewModelProtocol {
        let hero = heroes[indexPath.row]
        return HeroesCellViewModel(heroes: hero)
    }
    
    func aboutViewModel(at indexPath: IndexPath) -> AboutViewModelProtocol {
        let hero = heroes[indexPath.row]
        return AboutViewModel(url: hero.url ?? "")
    }
    
    
}
