//
//  MainViewController.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    var services: [Item] = []
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Services"
        
//        UIApplication.shared.open(URL(string: "https://sferum.ru/")!)

        
        self.getDate()
        
        mainView.getDatesCount = { [weak self] in
            return self?.services.count ?? 0
        }
        
        mainView.getDateForIndex = { [weak self] index in
            return self?.services[index]
        }
        
        mainView.presentService = { [weak self] data in
            let serviceVC = ServiceViewController()
            
            
        }

    }
    
    func getDate() {
        Parser().getInfo { [weak self] result in
            print(result)
            guard let self else { return }
            
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                self.services = data
                self.mainView.updateTable()
            }
        }
    }
}
