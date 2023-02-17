//
//  MainView.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import UIKit
import SnapKit

class MainView: UIView {
    let tableView: UITableView = {
        let tv = UITableView()
        tv.register(UINib(nibName: MainTableViewCell.cellID, bundle: nil), forCellReuseIdentifier: MainTableViewCell.cellID)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

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
