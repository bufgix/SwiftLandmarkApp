//
//  ProfileSummary.swift
//  swift-test1
//
//  Created by faruk on 5.12.2021.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(profile.username).bold().font(.title)
                
                Text("Notifications: \(profile.prefersNotification ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                VStack(alignment: .leading) {
                    Text("Recent Hikes").font(.headline)
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default).environmentObject(ModelData())
    }
}
