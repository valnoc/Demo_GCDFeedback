//
//  SubscribeToAuthStatusUseCase.swift
//  Feed
//
//  Created by Valeriy Bezuglyy on 11.09.2021.
//

import Foundation

protocol SubscribeToAuthStatusUseCase {
    func execute(_ onUpdate: @escaping (Bool) -> Void)
}

class SubscribeToAuthStatusUseCaseImpl: SubscribeToAuthStatusUseCase {
    func execute(_ onUpdate: @escaping (Bool) -> Void) {
        onUpdate(false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            onUpdate(true)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
                onUpdate(false)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                    onUpdate(true)
                })
            })
        })
    }
}
