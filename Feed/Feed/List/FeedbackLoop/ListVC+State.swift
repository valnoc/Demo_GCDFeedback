//
//  ListVC+State.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import Foundation

extension ListVC {
    struct State: FeedbackLoopableState {
        var title: String
        var items: [FeedItem]
        
        var requests: Set<Request>
        
        static func initial() -> Self {
            .init(title: "Список постов",
                  items: [],
                  requests: [])
        }
    }
}

extension ListVC {
    enum Event {
        case configure
        case didLoadItems(_ value: [FeedItem], _ request: State.Request)
        case didSelectItem(_ item: FeedItem)
        case didRouteToItem(_ request: State.Request)
    }
}

extension ListVC {
    static func reduce(state: State, event: Event) -> State {
        var state = state
        switch event {
        case .configure:
            state.requests.insert(.loadList)
        case let .didLoadItems(value, request):
            state.requests.remove(request)
            state.items = value
        case let .didSelectItem(item):
            state.requests.insert(.routeToItem(item.id))
        case let .didRouteToItem(request):
            state.requests.remove(request)
        }
        return state
    }
}

extension ListVC.State {
    enum Request: Hashable {
        case loadList
        case routeToItem(_ itemId: String)
        
        func isRouteToItem() -> Bool {
            switch self {
            case .routeToItem:
                return true
            default:
                return false
            }
        }
        
        static func ==(_ lhs: ListVC.State.Request, _ rhs: ListVC.State.Request) -> Bool {
            switch (lhs, rhs) {
            case (.loadList, .loadList):
                return true
            case let (.routeToItem(itemIdLhs), .routeToItem(itemIdRhs)):
                return itemIdLhs == itemIdRhs
            default:
                return false
            }
        }
    }
}
