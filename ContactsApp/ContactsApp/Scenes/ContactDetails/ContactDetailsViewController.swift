//
//  ContactDetailsViewController.swift
//  ContactsApp
//
//  Created by andreea.ungureanu on 29.07.2022.
//

import UIKit

final class ContactDetailsViewController: UIViewController {
    
    // MARK: - Private properties
    let viewModel: ContactDetailsViewModel
    
    init(viewModel: ContactDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
