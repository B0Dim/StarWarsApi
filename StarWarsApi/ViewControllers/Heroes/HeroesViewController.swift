//
//  HerousViewController.swift
//  StarWarsApi
//
//  Created by  BoDim on 24.01.2022.
//

import UIKit

class HeroesViewController: UITableViewController {

    var heroes: [Heroes] = []
    
    private var viewModel: HeroesViewModelProtocol! {
        didSet {
            viewModel.fetchHeroes {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HeroesViewModel()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = viewModel.cellViewModel(at: indexPath).heroName
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let aboutViewModel = viewModel.aboutViewModel(at: indexPath)
        performSegue(withIdentifier: "AboutVC", sender: aboutViewModel)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let AboutVC = segue.destination as? AboutViewController else { return }
        AboutVC.viewModel = sender as? AboutViewModelProtocol
    }
    

}

