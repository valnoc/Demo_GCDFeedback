//
//  ListInteractorImpl.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 07.08.2021.
//

import Foundation

class ListInteractorImpl {
    let repo = FeedItemsRepo()
}

extension ListInteractorImpl: ListInteractor {
    func loadItems(_ completion: @escaping ([FeedItem]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak self] in
            guard let __self = self else { return }
            completion(__self.repo.items())
        }
    }
}
