//
//  Activity.swift
//  homework10-11
//
//  Created by Maria Berger on 10.08.2021.
//

import Foundation

struct Activity: Decodable {
    let activity: String
    let type: String
    let price: Float
    let participants: Int
    
    var description: String {
        """
        Activity: \(activity)
        Type: \(type)
        Price: \(price)
        Participants: \(participants)
        """
    }
}

enum URLS: String {
    case activityWebSite = "http://www.boredapi.com/api/activity/"
}
