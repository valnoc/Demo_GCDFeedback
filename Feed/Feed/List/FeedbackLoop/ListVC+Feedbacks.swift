//
//  ListVC+Feedbacks.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import Foundation

extension ListVC {
    func feedbacks() -> [FeedbackLoopSystem<_State, _Event>.Feedback] {
        [loadItems]
    }
    
    func loadItems(_ newState: State, _ oldState: State, _ completion: @escaping (Event) -> Void) {
        guard !oldState.requests.contains(.loadList),
              newState.requests.contains(.loadList) else { return }
        interactor.loadItems { items in
            completion(.didLoadItems(items, .loadList))
        }
    }
}
