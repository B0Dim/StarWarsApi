//
//  NetworkManager.swift
//  StarWarsApi
//
//  Created by  BoDim on 24.01.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    //Прочитал тут, но не особо понял, как это работает. Со сбегающими замыкания у меня оч плохо, не понимаю их.
    //https://malcolmkmd.medium.com/writing-network-layer-in-swift-protocol-oriented-approach-4fa40ef1f908
    
    func fetchDataHeroes(_ completion: @escaping ([Heroes]) -> Void) {
        let publicApi = "https://www.swapi.tech/api/people"
        guard let url = URL(string: publicApi) else { return }

        URLSession.shared.dataTask(with: url) { data, result, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let heroes = try JSONDecoder().decode(HeroesResult.self, from: data)
                completion(heroes.results)
            } catch let error {
                print(error)
            }

        }.resume()
    }
    
    func fetchDataHero(url: String, _ completion: @escaping (HeroResult) -> Void) {
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let hero = try JSONDecoder().decode(HeroResult.self, from: data)
                completion(hero)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}
