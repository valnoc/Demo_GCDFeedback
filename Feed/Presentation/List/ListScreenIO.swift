//
//  ListScreenIO.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 22.08.2021.
//

import Foundation

protocol ListScreenInput {
    func configure()
}

protocol ListScreenOutput: AnyObject {
    func listScreen(_ listScreen: ListScreenInput, didSelectItem itemId: String)
}
