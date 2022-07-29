//
//  ContactsCoordinator.swift
//  ContactsApp
//
//  Created by andreea.ungureanu on 29.07.2022.
//

import UIKit

final class ContactsCoordinatorRouter: CoordinatorRouter {
    
}

final class ContactsCoordinator: NavigationFlowCoordinator {
    
    // MARK: - Public properries
    let router = ContactsCoordinatorRouter()
    
    // MARK: - Lifecycle
    required init(parent: FlowCoordinator? = nil, presentation: FlowCoordinatorPresentation = .custom) {
        super.init(parent: parent, presentation: presentation)
    }
    
    override func firstScreen() -> UIViewController {
        
        let viewModel = ContactsViewModel()
        return ContactsViewController(viewModel: viewModel)
    }
}
