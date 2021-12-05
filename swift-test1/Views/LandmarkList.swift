//
//  LandmarkList.swift
//  swift-test1
//
//  Created by faruk on 5.12.2021.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly = false
    
    var filteredData: [Landmark] {
        modelData.landmarks.filter({
            landmark in (!showFavoriteOnly || landmark.isFavorite)
        })
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoriteOnly, label: {
                    Text("Show only favorites")
                })
                ForEach(filteredData) { landmark in
                    NavigationLink{
                        LandmarkDetail(landMark: landmark)
                    }label: {
                        LandmarkRow(landMark: landmark)
                    }
                }
            }.navigationTitle("Places")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var modelData = ModelData()
    static var previews: some View {
        LandmarkList().environmentObject(modelData)
    }
}
