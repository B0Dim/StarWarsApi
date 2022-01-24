//
//  AboutViewController.swift
//  StarWarsApi
//
//  Created by  BoDim on 24.01.2022.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var aboutDetailLabel: UILabel!
    
    var url: String!
    var hero: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       sendRequest()
    }
    
    private func sendRequest() {
        NetworkManager.shared.fetchDataHero(url: url) { hero in
            DispatchQueue.main.async {
                self.hero = hero.result.properties
                self.setAboutData()
            }
        }
    }
    
    private func setAboutData() {
        aboutDetailLabel.text = hero?.description
    }

}
