//
//  CategoryView.swift
//  swift-test1
//
//  Created by faruk on 5.12.2021.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showProfile = false;
    
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image.resizable().scaledToFill()
                    .frame(height: 200)
                    .clipped()
                VStack {
                    ForEach(modelData.categories.keys.sorted(), id: \.self) {
                        key in CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    }
                }
            }.listStyle(.inset).navigationTitle("Featured").toolbar {
                Button {
                    showProfile.toggle()
                } label: {
                    Label("Profile", systemImage: "person.crop.circle")
                }
            }.sheet(isPresented: $showProfile) {
                ProfileHost().environmentObject(modelData)
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        CategoryView().environmentObject(ModelData())
    }
}
