//
//  MainViewController.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Private Properties

    private let mainView = MainView()
    private var services: [VKServiceItem] = []
    private let serviceProvider = VKServicesProvider()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getDate()
        
        navigationController?.navigationBar.tintColor = .red
        navigationItem.title = "Services"
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    
    // MARK: - Private Methods
    
    private func getDate() {
        serviceProvider.getInfo { [weak self] result in
            guard let self else {
                return
            }
            
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                self.services = data.items
                self.mainView.updateTable()
            }
        }
    }
}

    // MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = services[indexPath.row]
        let serviceVC = ServiceViewController()
        serviceVC.getInfo(info)
        self.navigationController?.pushViewController(serviceVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

    // MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = services[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.cellID, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        cell.name.text = model.name
        cell.logoIV.loadFrom(urlString: model.iconURL)
        
        return cell
    }    
}
