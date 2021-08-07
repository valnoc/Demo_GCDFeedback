//
//  ListVC+Feedbacks.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import Foundation

extension ListVC {
    func feedbacks() -> [FeedbackLoopSystem<_State, _Event>.Feedback] {
        [feedback1]
    }
    
    func feedback1(_ newState: State, _ oldState: State, _ completion: (Event) -> Void) {
        
    }
}
