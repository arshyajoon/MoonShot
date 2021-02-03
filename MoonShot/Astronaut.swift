//
//  Astronaut.swift
//  MoonShot
//
//  Created by Arshya GHAVAMI on 1/22/21.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    var missions: [Mission]  {
        let missions: [Mission] = Bundle.main.decode("missions.json")
        var astronautMissions = [Mission]()
        for mission in missions {
            for astronaut in mission.crew {
                if astronaut.name == self.id {
                    astronautMissions.append(mission)
                }
            }
            
        }
        return astronautMissions
    }
}
