//
//  FeedItemsRepo.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 11.09.2021.
//

import Foundation

protocol FeedItemsRepo {
    func loadItems(_ completion: @escaping ([FeedItem]) -> Void)
}
