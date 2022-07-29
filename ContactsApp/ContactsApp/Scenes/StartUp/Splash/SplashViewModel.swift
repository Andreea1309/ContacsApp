//
//  SplashViewModel.swift
//  ContactsApp
//
//  Created by andreea.ungureanu on 29.07.2022.
//

import UIKit
import Combine

final class SplashViewModelRouter: CoordinatorRouter {
    let showContacts = CoordinatorBinding<Void>()
}

final class SplashViewModel: ObservableObject {
    
    // MARK: - Private properties
    let contactService: ContactService
    
    // MARK: - Public properties
    let router = SplashViewModelRouter()
    var contacts: [Contact] = []
    
    init(contactService: ContactService = ContactService()) {
        self.contactService = contactService
        loadContacts()
    }
    
    private func loadContacts () {
        Task {
            self.contacts = try await contactService.fetchContactsWithAsyncURLSession()
            print("Contacts: \(contacts)")
            await showContacts()
        }
    }
    
    @MainActor
    private func showContacts() {
        router.showContacts.next(())
    }
}
