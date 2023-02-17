//
//  MainViewController.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Parser().getInfo { [weak self] result in
            print(result)
        }

        // Do any additional setup after loading the view.
    }
   

}
