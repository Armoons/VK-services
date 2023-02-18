//
//  ImageView+Ext..swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import UIKit

extension UIImageView {
    
    func loadFrom(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global(qos: .userInteractive).async {
            if let imageData = try? Data(contentsOf: url) {
                DispatchQueue.main.async { [weak self] in
                    if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                    }
                }
            }
        }
    }
}
