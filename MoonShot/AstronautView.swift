//
//  AstronautView.swift
//  MoonShot
//
//  Created by Arshya GHAVAMI on 1/23/21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var body: some View {
        GeometryReader { geometry in
                    ScrollView(.vertical) {
                        VStack {
                            Image(self.astronaut.id)
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width)

                            List(self.astronaut.missions) { mission in
                                Text(mission.displayName)
                            }
                            Text(self.astronaut.description)
                                .padding()
                                .layoutPriority(1)
                        }
                    }
                }
                .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
            }
    }


struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
