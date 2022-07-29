//
//  ContactsViewModel.swift
//  ContactsApp
//
//  Created by andreea.ungureanu on 29.07.2022.
//

import UIKit
import Combine

final class ContactsViewModelRouter: CoordinatorRouter {
}

final class ContactsViewModel: ObservableObject {
    
    // MARK: - Public properties
    let router = ContactsViewModelRouter()
}
