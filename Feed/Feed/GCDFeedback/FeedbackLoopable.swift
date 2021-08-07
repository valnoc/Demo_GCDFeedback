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
    
    var feedbackLoopSystem: FeedbackLoopSystem<State, Event>? { get set }
    
    static func reduce(state: State, event: Event) -> State
    func bindUI(_ newState: State, _ oldState: State, _ completion: @escaping (Event) -> Void)
    func feedbacks() -> [FeedbackLoopSystem<State, Event>.Feedback]
}

extension FeedbackLoopable {
    func driveFeedbackLoopSystem() {
        feedbackLoopSystem = .init(initialState: State.initial(),
                                   reducer: Self.reduce,
                                   feedbacks: feedbacks() + [bindUIClosure()])
    }
    
    func bindUI(_ newState: State, _ oldState: State, _ completion: (Event) -> Void) { }
}

extension FeedbackLoopable {
    fileprivate func bindUIClosure() -> FeedbackLoopSystem<State, Event>.Feedback {
        { [weak self] (_ newState: State, _ oldState: State, _ completion: @escaping (Event) -> Void) in
            guard let __self = self else { return }
            __self.bindUI(newState, oldState, completion)
        }
    }
}
