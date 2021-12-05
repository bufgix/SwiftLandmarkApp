//
//  EditProfile.swift
//  swift-test1
//
//  Created by faruk on 5.12.2021.
//

import SwiftUI

struct EditProfile: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Divider()
                TextField("Name", text: $profile.username)
            }
            Toggle(isOn: $profile.prefersNotification, label: {
                Text("Enable Notificaion").bold()
            })
            VStack {
                Text("Seasonal Photo").bold()
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases){
                        item in Text(item.rawValue).tag(item)
                    }
                }.pickerStyle(.segmented)
            }
            
            DatePicker(selection: $profile.goalDate,in: dateRange, displayedComponents: .date , label: {
                Text("Goal Data").bold()
            })
        }
    }
}

struct EditProfile_Previews: PreviewProvider {
    
    static var previews: some View {
        EditProfile(profile: .constant(.default))
    }
}
