//
//  CategoryRow.swift
//  swift-test1
//
//  Created by faruk on 5.12.2021.
//

import SwiftUI



struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName).font(.headline).padding(.leading, 15).padding(.bottom, 15)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(items){
                        item in NavigationLink{
                            LandmarkDetail(landMark: item)
                        } label: {
                            CategoryItem(landmark: item)
                        }
                    }
                }
            }
        }.padding(.top, 15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        CategoryRow(categoryName: modelData.landmarks[0].category.rawValue, items: Array(modelData.landmarks.prefix(3)))
    }
}
