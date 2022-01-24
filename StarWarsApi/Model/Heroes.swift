//
//  Herous.swift
//  StarWarsApi
//
//  Created by  BoDim on 24.01.2022.
//

import Foundation

struct HeroesResult: Decodable {
    let total_pages: Int?
    let next: String?
    let results: [Heroes]
}

struct Heroes: Decodable {
    let name: String?
    let url: String?
}

struct HeroResult: Decodable {
    let result: heroProperties
    let description: String?
}

struct heroProperties: Decodable {
    let properties: Hero
}

struct Hero: Decodable {
    let height: String?
    let mass: String?
    let hair_color: String?
    let skin_color: String?
    let eye_color: String?
    let birth_year: String?
    let gender: String?
    let name: String?
    
    var description: String {
        """
        name: \(name ?? "")
        height: \(height ?? "")
        mass: \(mass ?? "")
        hair_color: \(hair_color ?? "")
        skin_color: \(skin_color ?? "")
        eye_color: \(eye_color ?? "")
        birth_year: \(birth_year ?? "")
        gender: \(gender ?? "")
        """
    }
}
