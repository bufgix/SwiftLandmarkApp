//
//  Profile.swift
//  swift-test1
//
//  Created by faruk on 5.12.2021.
//

import Foundation


struct Profile {
    var username: String
    var prefersNotification: Bool = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "Omer")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { rawValue }
    }
}
