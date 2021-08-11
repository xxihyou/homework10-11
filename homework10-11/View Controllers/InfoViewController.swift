//
//  ViewController.swift
//  homework10-11
//
//  Created by Maria Berger on 10.08.2021.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet var descriptionLabel: UILabel!
    var activity: Activity?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: URLS.activityWebSite.rawValue)
        descriptionLabel.text = activity?.description
    }
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { activity in
            self.activity = activity
        }
}
}

