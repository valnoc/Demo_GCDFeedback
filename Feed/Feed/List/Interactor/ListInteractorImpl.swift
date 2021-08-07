//
//  ListInteractorImpl.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 07.08.2021.
//

import Foundation

class ListInteractorImpl {
    
}

extension ListInteractorImpl: ListInteractor {
    func loadItems(_ completion: @escaping ([FeedItem]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            completion([FeedItem(title: "",
                                 author: "",
                                 date: Date(),
                                 text: "",
                                 imageUrl: "")])
        }
    }
}
