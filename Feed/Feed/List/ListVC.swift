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
    var feedbackLoopSystem: FeedbackLoopSystem<State, Event>?
    
    let interactor: ListInteractor
    
    init(interactor: ListInteractor) {
        self.interactor = interactor
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
        feedbackLoopSystem?.acceptEvent(.configure)
    }


}

