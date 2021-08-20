//
//  ViewController.swift
//  homework10-11
//
//  Created by Maria Berger on 10.08.2021.
//

import UIKit
import Alamofire


class InfoViewController: UIViewController {
    
    @IBOutlet var postUrl: UIButton!
    @IBOutlet var descriptionLabel: UILabel!
    var activity: Activity?
    let postRequest = "https://jsonplaceholder.typicode.com/posts"

    
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

    @IBAction func postUrlAction(_ sender: UIButton) {
        postRequestwithDict()
    }

    
   

        private func postRequestwithDict() {
            guard let url = URL(string: postRequest) else { return }
            
            let activities = [
            
                "activity": "playing board games",
                "type": "recreational" ,
                "price": "10$",
                "participants": "6"
            ]
            
            guard let activityData = try? JSONSerialization.data(withJSONObject: activities, options: []) else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = activityData
            request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, let response = response else
                {print(error?.localizedDescription ?? "No description")
                return
                }
            print(response)
            print(activities)
            }.resume()
        }
}

