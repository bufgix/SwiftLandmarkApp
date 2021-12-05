//
//  LandmarkDetail.swift
//  swift-test1
//
//  Created by faruk on 5.12.2021.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landMark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landMark.id })!
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            MapView(coordinate: landMark.locationCoordinate).frame(height: 300)
            HStack(alignment: .top) {
                landMark.image.resizable().frame(width: 100, height: 100, alignment: .center).aspectRatio(1, contentMode: .fit).clipShape(Circle()).overlay(Circle().stroke(.brown, lineWidth: 4)).shadow(radius: 5).offset(y: -50).padding(.bottom, -50)
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(landMark.name).font(.title)
                        Text(landMark.state)
                            .foregroundColor(Color.brown)
                    }
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
            }.padding(.horizontal, 30)
            Text(landMark.description).padding()
            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landMark: modelData.landmarks[1]).environmentObject(modelData)
    }
}
