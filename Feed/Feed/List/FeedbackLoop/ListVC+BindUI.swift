//
//  ListVC+BindUI.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 01.08.2021.
//

import Foundation

extension ListVC {
    func bindUI(_ newState: _State, _ oldState: _State, _ completion: (_Event) -> Void) {
        navigationItem.title = newState.title
    }
}
