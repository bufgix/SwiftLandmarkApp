//
//  CategoryItem.swift
//  swift-test1
//
//  Created by faruk on 5.12.2021.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image.renderingMode(.original).resizable().frame(width: 155, height: 155).cornerRadius(5)
            Text(landmark.name).foregroundColor(.primary).font(.caption).fontWeight(.bold)
        }.padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[1])
    }
}
