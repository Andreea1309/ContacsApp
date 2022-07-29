//
//  CoordinatorBinding.swift
//  ContactsApp
//
//  Created by andreea.ungureanu on 29.07.2022.
//

import Foundation
import Combine

protocol CoordinatorRouter { }

final class CoordinatorBinding<T> {
     
    // MARK: - Private properties
    private let subject = PassthroughSubject<T, Never>()
    private var subscriptions: [AnyCancellable] = []
    
    // MARK: - Lifecycle
    
    func next(_ arg: T) {
        subject.send(arg)
    }
    
    func bind(_ action: @escaping (T) -> Void) {
        subject.sink { input in
            action(input)
        }
        .store(in: &subscriptions)
    }
}
