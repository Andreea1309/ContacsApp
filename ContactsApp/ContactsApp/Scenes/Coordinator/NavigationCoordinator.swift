//
//  NavigationCoordinator.swift
//  ContactsApp
//
//  Created by andreea.ungureanu on 29.07.2022.
//

import UIKit

class NavigationFlowCoordinator: FlowCoordinator {
    
    fileprivate (set) var parentFlow: FlowCoordinator?
    fileprivate (set) var flowPresentation: FlowCoordinatorPresentation
    
    private (set) var navigationController: UINavigationController?
    
    var mainViewController: UIViewController? {
        navigationController
    }
    
    // MARK: - Lifecycle
    
    required init(parent: FlowCoordinator? = nil, presentation: FlowCoordinatorPresentation = .custom) {
        parentFlow = parent
        flowPresentation = presentation
    }
    
    func initMainViewController() {
        guard navigationController == nil else { return }
        
        // Starting flow from an existing flow
        if let parentFlow = parentFlow {
            if flowPresentation == .present {
                let root = firstScreen()
                navigationController = UINavigationController(rootViewController: root)
            } else if flowPresentation == .push {
                if let parentNavFlow = parentFlow as? NavigationFlowCoordinator {
                    navigationController = parentNavFlow.navigationController
                }
            }
            // Starting flow with no parent
        } else {
            if flowPresentation == .custom {
                let root = firstScreen()
                navigationController = UINavigationController(rootViewController: root)
            }
        }
    }
    
    func firstScreen() -> UIViewController { UIViewController() }

    func finish(customDismiss: CustomPresentation?, completion: (() -> Void)? = nil) {
        if flowPresentation == .present {
            guard let parentFlow = parentFlow else {
                assertionFailure("Parent nil when trying to dismiss")
                return
            }
            parentFlow.mainViewController?.dismiss(animated: true, completion: completion)
        }
        navigationController = nil
    }
}

extension NavigationFlowCoordinator {
    
    var navController: UINavigationController? {
        navigationController?.presentedViewController as? UINavigationController ?? navigationController
    }
}
