//
//  ServiceViewController.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import UIKit

class ServiceViewController: UIViewController {
    
    let serviceView = ServiceView()
    
    func getInfo(_ data: Item) {
        serviceView.getData(data)
        navigationItem.title = data.name
    }
    
    override func loadView() {
        self.view = serviceView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
