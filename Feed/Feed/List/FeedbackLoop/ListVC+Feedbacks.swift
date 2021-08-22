//
//  ListVC+Feedbacks.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import Foundation

extension ListVC {
    func feedbacks() -> [FeedbackLoopSystem<State, Event>.Feedback] {
        [loadItems, output]
    }
    
    func loadItems(_ newState: State, _ oldState: State, _ action: @escaping (Event) -> Void) {
        guard !oldState.requests.contains(.loadList),
              newState.requests.contains(.loadList) else { return }
        interactor.loadItems { items in
            action(.didLoadItems(items, .loadList))
        }
    }
    
    func output(_ newState: State, _ oldState: State, _ action: @escaping (Event) -> Void) {
        guard oldState.requests.first(where: { $0.isOutput() }) == nil,
              case let .output(value) = newState.requests.first(where: { $0.isOutput() }) else { return }
        
        switch value {
        case let .didSelectItem(itemId):
            output?.listScreen(self, didSelectItem: itemId)
            action(.didFinishRequest(.output(value)))
        }
    }
}
