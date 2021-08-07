//
//  ListVC+State.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import Foundation

extension ListVC {
    struct _State: FeedbackLoopableState {   
        static func initial() -> Self { .init() }
    }
}

extension ListVC {
    enum _Event {
//        case configure
    }
}

extension ListVC {
    static func reduce(state: _State, event: _Event) -> _State {
        var state = state
        
        switch event {
        }
        
        return state
    }
}
