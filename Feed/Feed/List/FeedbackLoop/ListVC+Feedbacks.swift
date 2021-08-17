//
//  ListVC+Feedbacks.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import Foundation

extension ListVC {
    func feedbacks() -> [FeedbackLoopSystem<State, Event>.Feedback] {
        [loadItems, routeToItem]
    }
    
    func loadItems(_ newState: State, _ oldState: State, _ action: @escaping (Event) -> Void) {
        guard !oldState.requests.contains(.loadList),
              newState.requests.contains(.loadList) else { return }
        interactor.loadItems { items in
            action(.didLoadItems(items, .loadList))
        }
    }
    
    func routeToItem(_ newState: State, _ oldState: State, _ action: @escaping (Event) -> Void) {
        guard oldState.requests.first(where: { $0.isRouteToItem() }) == nil,
              case let .routeToItem(item) = newState.requests.first(where: { $0.isRouteToItem() }) else { return }
        DispatchQueue.main.async {
            action(.didRouteToItem(.routeToItem(item)))
        }
    }
}
