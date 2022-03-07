//
//  AboutViewModel.swift
//  StarWarsApi
//
//  Created by  BoDim on 07.03.2022.
//

import Foundation

protocol AboutViewModelProtocol {
    var url: String { get }
    var description: String { get }
    var hero: Hero? { get }
    func fetchHero(completion: @escaping() -> Void)
    init(url: String)
}

class AboutViewModel: AboutViewModelProtocol {
    
    var url: String {
        urlAddress
    }

    var hero: Hero?
    
    func fetchHero(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchDataHero(url: url) { hero in
            DispatchQueue.main.async {
                self.hero = hero.result.properties
                completion()
            }
        }
    }
    
    var description: String {
        hero?.description ?? ""
    }
    
    private let urlAddress: String
    
    required init(url: String) {
        self.urlAddress = url
    }
    
}
