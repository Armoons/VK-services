//
//  ServiceViewController.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import UIKit

class ServiceViewController: UIViewController {
    
    let serviceView = ServiceView()
    
    override func loadView() {
        self.view = serviceView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
