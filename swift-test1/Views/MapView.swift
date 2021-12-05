//
//  MapView.swift
//  swift-test1
//
//  Created by faruk on 4.12.2021.
//

import SwiftUI
import MapKit

struct Marker: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}


struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    var annotationItems: [Marker] = [
        Marker(coordinate: CLLocationCoordinate2D(latitude: 37.810000, longitude: -122.477450)),
    
       ]
    @State private var region = MKCoordinateRegion()
    
    
    private func setRegion(_ coord: CLLocationCoordinate2D){
        region = MKCoordinateRegion(
        center: coord, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotationItems){
            mark in MapMarker(coordinate: coordinate, tint: .red)
        }.onAppear(perform: {
            setRegion(coordinate)
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
