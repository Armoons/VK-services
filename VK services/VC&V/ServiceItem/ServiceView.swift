//
//  ServiceView.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import UIKit

class ServiceView: UIView {
    
    private var logoIV: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .black
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    let urlLabel: UILabel = {
        let label = UILabel()
        label.text = "ссылка"
        label.font = UIFont.systemFont(ofSize: 28)
        label.textColor = .black
        label.isUserInteractionEnabled = true
        label.numberOfLines = 1
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "StringWithUnderLine", attributes: underlineAttribute)
        label.attributedText = underlineAttributedString
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
     
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        for view in [logoIV, nameLabel, descriptionLabel, urlLabel] {
            self.addSubview(view)
        }
        
        logoIV.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(150)
            $0.width.equalTo(logoIV.snp.height).multipliedBy(1.0 / 1.0)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(logoIV.snp.bottom).inset(18)
            $0.leading.trailing.lessThanOrEqualToSuperview().inset(18)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).inset(18)
            $0.leading.trailing.lessThanOrEqualToSuperview().inset(18)
        }
        
        urlLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).inset(18)
            $0.centerX.equalToSuperview()
        }
        
    }
}
