//
//  ContactDetailsViewModel.swift
//  ContactsApp
//
//  Created by andreea.ungureanu on 29.07.2022.
//

import UIKit
import Combine

final class ContactDetailsViewModelRouter: CoordinatorRouter {
}

final class ContactDetailsViewModel: ObservableObject {
    
    // MARK: - Public properties
    let router = ContactDetailsViewModelRouter()
}
