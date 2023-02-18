//
//  ServiceViewController.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import UIKit

class ServiceViewController: UIViewController {
    
    // MARK: - Private Properties

    private let serviceView = ServiceView()
    
    // MARK: - ViewController lifecycle methods
    
    override func loadView() {
        self.view = serviceView
    }
    
    // MARK: - Public Methods
    
    func getInfo(_ data: Item) {
        serviceView.getData(data)
        navigationItem.title = data.name
    }
}
