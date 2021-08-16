//
//  ListVC+BindUI.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import Foundation

extension ListVC {
    func bindUI(_ newState: State, _ oldState: State, _ completion: (Event) -> Void) {
        navigationItem.title = newState.title
    }
}
