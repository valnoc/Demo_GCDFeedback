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
    
    func subscribeToAuthorizedChange(_ action: @escaping (Bool) -> Void) {
        action(false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            action(true)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
                action(false)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                    action(true)
                })
            })
        })
    }
}
