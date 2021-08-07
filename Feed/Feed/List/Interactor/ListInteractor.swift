//
//  ListInteractor.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 07.08.2021.
//

import Foundation

protocol ListInteractor {
    func loadItems(_ completion: @escaping ([FeedItem]) -> Void)
}

struct FeedItem: Equatable {
    let title: String
    let author: String
    let date: Date
    let text: String?
    let imageUrl: String?
    
    static func ==(_ lhs: FeedItem, rhs: FeedItem) -> Bool {
        guard lhs.title == rhs.title else { return false }
        guard lhs.author == rhs.author else { return false }
        guard lhs.date == rhs.date else { return false }
        guard lhs.text == rhs.text else { return false }
        guard lhs.imageUrl == rhs.imageUrl else { return false }
        return true
    }
}
