//
//  FeedbackLoopSystem.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import Foundation

class FeedbackLoopSystem<State: Equatable, Event> {
    typealias Feedback = (_ newState: State, _ oldState: State, _ completion: @escaping (Event) -> Void) -> Void
    
    private var queue = DispatchQueue(label: "FeedbackLoopSystem_queue")
    
    private var state: State
    private let reducer: (State, Event) -> State
    private let feedbacks: [Feedback]
    
    init(initialState: State,
         reducer: @escaping (State, Event) -> State,
         feedbacks: [Feedback]) {
        self.state = initialState
        self.reducer = reducer
        self.feedbacks = feedbacks
    }
}

extension FeedbackLoopSystem {
    func acceptEvent(_ event: Event) {
        queue.async { [weak self] in
            guard let __self = self else { return }
            
            let oldState = __self.state
            let newState = __self.reducer(oldState, event)
            
            guard newState != oldState else { return }
            __self.state = newState
            
            __self.feedbacks.forEach { $0(newState, oldState, { [weak self] (event) in
                self?.acceptEvent(event)
            }) }
        }
    }
}
