//
//  FeedItemsRepo.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 16.08.2021.
//

import Foundation

class FeedItemsRepo {
    func items() -> [FeedItem] {
        guard let url = Bundle.main.url(forResource: "feeditems", withExtension: "json") else { return [] }
        do {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode([FeedItem].self, from: data)
            return result
        } catch {
            return []
        }
    }
}
