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
        case didFinishRequest(_ request: State.Request)
    }
}

extension ListVC {
    static func reduce(state: State, event: Event) -> State {
        print(event)
        var state = state
        switch event {
        case .configure:
            state.requests.insert(.loadList)
        case let .didLoadItems(value, request):
            state.requests.remove(request)
            state.items = value
        case let .didSelectItem(item):
            state.requests.insert(.output(.didSelectItem(item.id)))
        case let .didFinishRequest(request):
            state.requests.remove(request)
        }
        return state
    }
}

extension ListVC.State {
    enum Request: Hashable {
        case loadList
        case output(_ value: Output)
        
        func isOutput() -> Bool {
            switch self {
            case .output:
                return true
            default:
                return false
            }
        }
        
        static func ==(_ lhs: ListVC.State.Request, _ rhs: ListVC.State.Request) -> Bool {
            switch (lhs, rhs) {
            case (.loadList, .loadList):
                return true
            case let (.output(valueLhs), .output(valueRhs)):
                return valueLhs == valueRhs
            default:
                return false
            }
        }
    }
}

extension ListVC.State.Request {
    enum Output: Hashable {
        case didSelectItem(_ itemId: String)
        
        static func ==(_ lhs: ListVC.State.Request.Output, _ rhs: ListVC.State.Request.Output) -> Bool {
            switch (lhs, rhs) {
            case let (.didSelectItem(itemIdLhs), .didSelectItem(itemIdRhs)):
                return itemIdLhs == itemIdRhs
            }
        }
    }
}
