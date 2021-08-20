//
//  ActivitiesTableViewController.swift
//  homework10-11
//
//  Created by Maria Berger on 10.08.2021.
//

import UIKit
import Alamofire

class ActivitiesTableViewController: UITableViewController {

    private var activity: Activity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: URLS.activityWebSite.rawValue)
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }

        cell.cellLabel.text = activity?.activity
    
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showInfo", sender: nil)
        let infoVC = InfoViewController()
        infoVC.activity = activity
    }

    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { activity in
            self.activity = activity
            self.tableView.reloadData()
        }
}

}
