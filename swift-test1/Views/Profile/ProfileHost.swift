//
//  ProfileHost.swift
//  swift-test1
//
//  Created by faruk on 5.12.2021.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode;
    @State private var draftProfile = Profile.default
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", action: {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    })
                }
                Spacer()
                EditButton()
            }
   
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            }else {
                EditProfile(profile: $draftProfile).onAppear(perform: {
                    draftProfile = modelData.profile
                }).onDisappear(perform: {
                    modelData.profile = draftProfile
                })
            }
            Spacer()
            
        }.padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(ModelData())
    }
}
