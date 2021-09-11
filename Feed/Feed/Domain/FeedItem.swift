//
//  FeedItem.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 16.08.2021.
//

import Foundation

struct FeedItem: Equatable, Codable {
    let id: String
    let title: String
    let text: String
    var liked: Bool
    
    static func ==(_ lhs: FeedItem, _ rhs: FeedItem) -> Bool {
        guard lhs.id == rhs.id else { return false }
        guard lhs.title == rhs.title else { return false }
        guard lhs.text == rhs.text else { return false }
        guard lhs.liked == rhs.liked else { return false }
        return true
    }
}
