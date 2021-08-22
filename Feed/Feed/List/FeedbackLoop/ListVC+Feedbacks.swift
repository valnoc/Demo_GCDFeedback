//
//  ListVC+Feedbacks.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import Foundation

extension ListVC {
    func feedbacks() -> [FeedbackLoopSystem<State, Event>.Feedback] {
        [loadItems, output, subscribeToAuthorized]
    }
    
    func loadItems(_ newState: TState, _ oldState: TState, _ action: @escaping (TEvent) -> Void) {
        guard !oldState.requests.contains(.loadList),
              newState.requests.contains(.loadList) else { return }
        interactor.loadItems { items in
            action(.didLoadItems(items, .loadList))
        }
    }

    func output(_ newState: TState, _ oldState: TState, _ action: @escaping (TEvent) -> Void) {
        guard oldState.requests.first(where: { $0.isOutput() }) == nil,
              case let .output(value) = newState.requests.first(where: { $0.isOutput() }) else { return }
        
        switch value {
        case let .didSelectItem(itemId):
            output?.listScreen(self, didSelectItem: itemId)
            action(.didFinishRequest(.output(value)))
        }
    }
    
    func subscribeToAuthorized(_ newState: TState, _ oldState: TState, _ action: @escaping (TEvent) -> Void) {
        guard !oldState.requests.contains(.subscribeToAuthorized),
              newState.requests.contains(.subscribeToAuthorized) else { return }
        interactor.subscribeToAuthorizedChange { status in
            action(.didChangeAuthorizedStatus(status))
        }
        action(.didFinishRequest(.subscribeToAuthorized))
    }
}
