//
//  ContentView.swift
//  swift-test1
//
//  Created by faruk on 4.12.2021.
//

import SwiftUI



struct ContentView: View {
    @StateObject private var modelData = ModelData()
    
    var body: some View {
        LandmarkList().environmentObject(modelData)
    }
}
 



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(ModelData())
        }
    }
}
