//
//  ContentView.swift
//  swift-test1
//
//  Created by faruk on 4.12.2021.
//

import SwiftUI



struct ContentView: View {
    @StateObject private var modelData = ModelData()
    @State private var selectedTab: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LandmarkList().tabItem{
                Label("Feature", systemImage: "star")
            }.tag(Tab.list)
            CategoryView().tabItem{
                Label("List", systemImage: "list.bullet")
            }.tag(Tab.featured)
        }
    }
}
 



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(ModelData())
        }
    }
}
