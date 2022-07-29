//
//  MainCoordinator.swift
//  ContactsApp
//
//  Created by andreea.ungureanu on 29.07.2022.
//

import UIKit

final class MainCoordinator {
    
    // MARK: - Private properties
    private weak var window: UIWindow?
    
    private var contactsCoordinator: ContactsCoordinator?
    private var startUpCoordinator: StartUpCoordinator?
    
    // MARK: - Lifecycle
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        showStartUp()
    }
    
    // MARK: - StartUp
    private func showStartUp() {
        let coordinator = StartUpCoordinator(parent: nil, presentation: .custom)
        coordinator.router.showContacts.bind(dismissStartUp)
        coordinator.router.showContacts.bind(showContactsCoordinator)
        show(flow: coordinator)
        self.startUpCoordinator = coordinator
    }
    
    private func dismissStartUp() {
        startUpCoordinator?.finish(customDismiss: nil)
        startUpCoordinator = nil
    }
    
    // MARK: - Home
    private func showContactsCoordinator() {
        let coordinator = ContactsCoordinator(parent: nil, presentation: .custom)
        show(flow: coordinator)
        self.contactsCoordinator = coordinator
    }
    
}

// MARK: - Utils

extension MainCoordinator {
    
    private var root: UIViewController? {
        window?.rootViewController
    }
    
    private func setRoot(to viewController: UIViewController?, animated: Bool = false) {
        guard let viewController = viewController else { return }
        
        guard root != viewController else { return }
        
        func changeRoot(to viewController: UIViewController) {
            window?.rootViewController = viewController
        }
        
        if animated, let snapshotView = window?.snapshotView(afterScreenUpdates: true) {
            viewController.view.addSubview(snapshotView)
            
            changeRoot(to: viewController)
            
            UIView.animate(withDuration: 0.33,
                           animations: { snapshotView.alpha = 0 },
                           completion: { _ in snapshotView.removeFromSuperview() })
        } else {
            changeRoot(to: viewController)
        }
    }
    
    private func show(flow: FlowCoordinator, animated: Bool = true) {
        flow.start { flowMainController in
            self.setRoot(to: flowMainController, animated: animated)
        }
    }
}
