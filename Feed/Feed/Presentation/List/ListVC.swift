//
//  ListVC.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import UIKit

class ListVC: UIViewController, FeedbackLoopable {
    typealias TState = State
    typealias TEvent = Event
    var feedbackLoopSystem: FeedbackLoopSystem<TState, TEvent>?
    var feedbackLoopSystemInput: FeedbackLoopSystemInput<TState, TEvent> = .init()
    
    weak var output: ListScreenOutput?
    
    let loadFeedItemsUseCase: LoadFeedItemsUseCase
    let subscribeToAuthStatusUseCase: SubscribeToAuthStatusUseCase
    
    init(loadFeedItemsUseCase: LoadFeedItemsUseCase,
         subscribeToAuthStatusUseCase: SubscribeToAuthStatusUseCase) {
        self.loadFeedItemsUseCase = loadFeedItemsUseCase
        self.subscribeToAuthStatusUseCase = subscribeToAuthStatusUseCase
        super.init(nibName: nil, bundle: nil)
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
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        driveFeedbackLoopSystem()
    }
}

extension ListVC: ListScreenInput {
    func configure() {
        feedbackLoopSystemInput.acceptEvent(.configure)
    }
}
