//
//  ServiceView.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import UIKit

class ServiceView: UIView {
    
    // MARK: - Private Properties
    
    private var serviceInfo: VKServiceItem?
    
    private var urlForOpen: String?
    
    private var logoIV: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private var urlLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28)
        label.textColor = .black
        label.isUserInteractionEnabled = true
        label.numberOfLines = 1
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Cсылка->", attributes: underlineAttribute)
        label.attributedText = underlineAttributedString
        return label
    }()
    
    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setupUI()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(titleTapped))
        urlLabel.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    @objc func titleTapped() {
        guard let url = URL(string: serviceInfo?.serviceURL ?? "") else {
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func getData(_ data: VKServiceItem) {
        self.serviceInfo = data
        setupContent()
    }
    
    // MARK: - Private Methods

    private func setupContent() {
        if let data = serviceInfo {
            self.nameLabel.text = data.name
            if let url = URL(string: data.iconURL) {
                ImageProvider.shared.downloadImage(url: url) { image in
                    self.logoIV.image = image
                }
            }
            self.descriptionLabel.text = data.description
            self.urlForOpen = data.serviceURL
        }
    }
    
    private func setupUI() {
        for view in [logoIV, nameLabel, descriptionLabel, urlLabel] {
            self.addSubview(view)
        }
        
        logoIV.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).inset(18)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(150)
            $0.width.equalTo(logoIV.snp.height).multipliedBy(1.0 / 1.0)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(logoIV.snp.bottom).inset(-18)
            $0.leading.equalToSuperview().inset(18)
            $0.trailing.equalToSuperview().inset(18)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).inset(-18)
            $0.leading.equalToSuperview().inset(18)
            $0.trailing.equalToSuperview().inset(18)
        }
        
        urlLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).inset(-18)
            $0.centerX.equalToSuperview()
        }
    }
}
