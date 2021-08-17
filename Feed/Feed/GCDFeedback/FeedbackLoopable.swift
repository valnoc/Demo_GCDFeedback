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
    associatedtype TState: FeedbackLoopableState
    associatedtype TEvent
    
    var feedbackLoopSystem: FeedbackLoopSystem<TState, TEvent>? { get set }
    
    static func reduce(state: TState, event: TEvent) -> TState
    func bindUI(_ newState: TState, _ oldState: TState, _ action: @escaping (TEvent) -> Void)
    func feedbacks() -> [FeedbackLoopSystem<TState, TEvent>.Feedback]
}

extension FeedbackLoopable {
    func driveFeedbackLoopSystem() {
        feedbackLoopSystem = .init(initialState: TState.initial(),
                                   reducer: Self.reduce,
                                   feedbacks: feedbacks() + [bindUIClosure()])
    }
    
    func bindUI(_ newState: TState, _ oldState: TState, _ action: @escaping (TEvent) -> Void) { }
}

extension FeedbackLoopable {
    fileprivate func bindUIClosure() -> FeedbackLoopSystem<TState, TEvent>.Feedback {
        { [weak self] (_ newState: TState, _ oldState: TState, _ action: @escaping (TEvent) -> Void) in
            guard let __self = self else { return }
            __self.bindUI(newState, oldState, action)
        }
    }
}
