//
//  ListVC.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import UIKit

class ListVC: UIViewController, FeedbackLoopable {
    typealias State = _State
    typealias Event = _Event
    
    var feedbackLoopSystem: FeedbackLoopSystem<_State, _Event>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        driveFeedbackLoopSystem()
    }


}

