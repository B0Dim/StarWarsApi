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
    var viewModel: AboutViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(viewModel.url)
        viewModel.fetchHero { [weak self] in
            DispatchQueue.main.async {
                self?.setAboutData()
            }
        }
    }

    
    private func setAboutData() {
        aboutDetailLabel.text = viewModel.hero?.description
    }

}
