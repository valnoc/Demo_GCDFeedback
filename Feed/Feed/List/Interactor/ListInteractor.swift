//
//  ListInteractor.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 07.08.2021.
//

import Foundation

protocol ListInteractor {
    func loadItems(_ completion: @escaping ([FeedItem]) -> Void)
}

struct FeedItem {
    let title: String
    let author: String
    let date: Date
    let text: String?
    let imageUrl: String?
}
