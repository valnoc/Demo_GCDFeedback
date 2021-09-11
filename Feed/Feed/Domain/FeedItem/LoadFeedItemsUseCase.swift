//
//  LoadFeedItemsUseCase.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 11.09.2021.
//

import Foundation

protocol LoadFeedItemsUseCase {
    func execute(_ completion: @escaping ([FeedItem]) -> Void)
}

class LoadFeedItemsUseCaseImpl: LoadFeedItemsUseCase {
    private let repo: FeedItemsRepo
    
    init(repo: FeedItemsRepo) {
        self.repo = repo
    }
    
    func execute(_ completion: @escaping ([FeedItem]) -> Void) {
        repo.loadItems(completion)
    }
}
