//
//  Mission.swift
//  MoonShot
//
//  Created by Arshya GHAVAMI on 1/22/21.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    var crewMembers: String {
        var namesArray = [String]()
        for i in crew {
            namesArray.append(i.name)
        }
        return namesArray.joined(separator: ", ")
    }

    var image: String {
        "apollo\(id)"
    }

    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
}




