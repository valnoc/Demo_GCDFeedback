//
//  FeedbackLoopable.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import UIKit

protocol FeedbackLoopableState: Equatable {
    static func initial() -> Self
}

protocol FeedbackLoopable: AnyObject {
    associatedtype State: FeedbackLoopableState
    associatedtype Event
    
    var system: FeedbackLoopSystem<State, Event>? { get set }
    
    static func reduce(state: State, event: Event) -> State
    func handleNewState(_ state: State)
}

extension FeedbackLoopable {
    func driveSystem() {
        system = FeedbackLoopSystem(initialState: State.initial(),
                                    reducer: Self.reduce,
                                    feedbacks: [])
    }
}
