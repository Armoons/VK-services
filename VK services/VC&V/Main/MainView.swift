//
//  MainView.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    var getDatesCount: (() -> (Int))?
    
    var getDateForIndex: ((Int) -> (Item)?)?
    
    var presentService: ((Item)->())?


    let tableView: UITableView = {
        let tv = UITableView()
        tv.register(UINib(nibName: MainTableViewCell.cellID, bundle: nil), forCellReuseIdentifier: MainTableViewCell.cellID)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func updateTable() {
        tableView.reloadData()
    }
    
    

}

extension MainView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let info = getDateForIndex?(indexPath.row) else { return }
        self.presentService?(info)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}

extension MainView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.getDatesCount?() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = getDateForIndex?(indexPath.row) else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.cellID, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        cell.name.text = model.name
        cell.logoIV.loadFrom(urlString: model.iconURL)
        
        return cell
    }
    
    
}
