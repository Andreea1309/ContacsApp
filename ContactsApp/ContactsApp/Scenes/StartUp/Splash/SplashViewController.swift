//
//  SplashViewController.swift
//  ContactsApp
//
//  Created by andreea.ungureanu on 29.07.2022.
//

import UIKit

final class SplashViewController: UIViewController {
    
    // MARK: - Private properties
    private let viewModel: SplashViewModel
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .yellow
    }
}
