//
//  ListVC+BindUI.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import Foundation

extension ListVC {
    func bindUI(_ newState: State, _ oldState: State, _ completion: (Event) -> Void) {
        DispatchQueue.main.sync {
            navigationItem.title = newState.title
            
            if newState.items != oldState.items {
                viewList?.updateList(newState.items
                                        .map({ .init(title: $0.title,
                                                     text: $0.text) }))
            }
        }
    }
}
