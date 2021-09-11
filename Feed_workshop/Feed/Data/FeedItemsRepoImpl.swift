//
//  FeedItemsRepoImpl.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 16.08.2021.
//

import Foundation

class FeedItemsRepoImpl: FeedItemsRepo {
    
    func loadItems(_ completion: @escaping ([FeedItem]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak self] in
            guard let __self = self else { return }
            completion(__self.items())
        }
    }
}

extension FeedItemsRepoImpl {
    private func items() -> [FeedItem] {
        guard let path = Bundle.main.path(forResource: "feedItems", ofType: "json") else { return [] }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let result = try JSONDecoder().decode([FeedItem].self, from: data)
            return result
        } catch {
            print(error)
            return []
        }
    }
}
