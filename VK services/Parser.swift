//
//  Parser.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import Foundation
import UIKit

class Parser {
    typealias ResultCompletion = (Result<[Item], Error>) -> ()
    private static let url = URL(string: "https://mobile-olympiad-trajectory.hb.bizmrg.com/semi-final-data.json")

    
    func getInfo(completion: @escaping ResultCompletion) {
        guard let url = Self.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            guard let data = data else { return }
            
            do {
                let userInfo = try JSONDecoder().decode(Services.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(userInfo.items))
                }
            }  catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
//    func getImageFromURL(urlString: String) -> UIImage {
//        if let url = URL(string: urlString) {
//            let task = URLSession.shared.dataTask(with: url) { data, response, error in
//                guard let data = data, error == nil else { return }
//
//                DispatchQueue.main.async {
//                    return UIImage(data: data)
//                }
//            }
//
//            task.resume()
//        }
//
//    }
    
    
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
