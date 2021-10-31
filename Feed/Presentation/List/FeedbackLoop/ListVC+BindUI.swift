//
//  ListVC+BindUI.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import Foundation

extension ListVC {
    func bindUI(_ newState: TState, _ oldState: TState, _ action: @escaping (TEvent) -> Void) {
        DispatchQueue.main.sync {
            navigationItem.title = newState.title
            
            if newState.items != oldState.items ||
                newState.authorized != oldState.authorized {
                viewList?.updateList(newState.items
                                        .map({ item in
                                                .init(title: item.title,
                                                      text: item.text,
                                                      isLiked: item.liked,
                                                      showLikeButton: newState.authorized,
                                                      likeAction: { action(.didPressToggleLike(item)) },
                                                      userInfo: item) }),
                                     action: action)
            }
        }
    }
}
