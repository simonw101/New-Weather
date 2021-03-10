//
//  ForecastListViewViewController.swift
//  Weather
//
//  Created by Simon Wilson on 04/03/2021.
//

import UIKit

class ForecastListViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var forecatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        forecatTableView.delegate = self
        forecatTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "test"
        return cell
    }
    
}
