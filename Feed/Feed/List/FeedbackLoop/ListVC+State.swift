//
//  ListVC+State.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import Foundation

extension ListVC {
    struct _State: FeedbackLoopableState {
        var title: String
//        var items: [FeedItem]
        
        var requests: Set<Request>
        
        enum Request: Equatable {
            case loadList
        }
        
        static func initial() -> Self {
            .init(title: "Список постов",
//                  items: [],
                  requests: [])
        }
    }
}

extension ListVC {
    enum _Event {
        case configure
        case didLoadItems(_ value: [FeedItem], _ request: State.Request)
    }
}

extension ListVC {
    static func reduce(state: _State, event: _Event) -> _State {
        var state = state
        switch event {
        case .configure:
            state.requests.insert(.loadList)
        case let .didLoadItems(value, request):
            state.requests.remove(request)
//            state.items = value
        }
        return state
    }
}
