//
//  StartUpCoordinator.swift
//  ContactsApp
//
//  Created by andreea.ungureanu on 29.07.2022.
//

import UIKit

final class StartUpCoordinatorRouter: CoordinatorRouter {
    let showContacts = CoordinatorBinding<Void>()
}

final class StartUpCoordinator: NavigationFlowCoordinator {
    
    // MARK: - Public properries
    let router = StartUpCoordinatorRouter()
    
    // MARK: - Lifecycle
    required init(parent: FlowCoordinator? = nil, presentation: FlowCoordinatorPresentation = .custom) {
        super.init(parent: parent, presentation: presentation)
    }
    
    override func firstScreen() -> UIViewController {
        let viewModel = SplashViewModel()
        viewModel.router.showContacts.bind(showContacts)
        return SplashViewController(viewModel: viewModel)
    }
    
    private func showContacts() {
        router.showContacts.next(())
    }
}


