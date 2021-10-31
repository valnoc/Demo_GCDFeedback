//
//  ListVC.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import UIKit
import GCDFeedback

class ListVC: UIViewController, FeedbackLoopable {
    typealias TState = State
    typealias TEvent = Event
    var feedbackLoopSystem: FeedbackLoopSystem<TState, TEvent>?
    
    weak var output: ListScreenOutput?
    
    let loadFeedItemsUseCase: LoadFeedItemsUseCase
    let subscribeToAuthStatusUseCase: SubscribeToAuthStatusUseCase
    
    init(loadFeedItemsUseCase: LoadFeedItemsUseCase,
         subscribeToAuthStatusUseCase: SubscribeToAuthStatusUseCase) {
        self.loadFeedItemsUseCase = loadFeedItemsUseCase
        self.subscribeToAuthStatusUseCase = subscribeToAuthStatusUseCase
        super.init(nibName: nil, bundle: nil)
        
        driveFeedbackLoopSystem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = ListView()
    }

    var viewList: ListView? {
        view as? ListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ListVC: ListScreenInput {
    func configure() {
        feedbackLoopSystem?.acceptEvent(.configure)
    }
}
