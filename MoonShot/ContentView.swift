//
//  ContentView.swift
//  MoonShot
//
//  Created by Arshya GHAVAMI on 1/21/21.
//

import SwiftUI




struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingLaunchDates = false
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts))  {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(showingLaunchDates ?  mission.formattedLaunchDate : mission.crewMembers)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(leading: Button(action: {
                self.showingLaunchDates.toggle()
            }){
                
                Toggle(isOn: $showingLaunchDates) {
                    Text("Showing Launch Dates")
                }
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

