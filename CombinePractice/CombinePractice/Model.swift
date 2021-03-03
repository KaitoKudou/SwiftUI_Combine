//
//  Model.swift
//  CombinePractice
//
//  Created by 工藤海斗 on 2021/03/03.
//

import Foundation

struct ConnpassGeneral: Codable {
    let events: [Event]
}

struct Event: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    let eventUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "event_id"
        case title = "title"
        case eventUrl = "event_url"
    }
}
