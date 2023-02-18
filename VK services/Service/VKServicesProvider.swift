//
//  Parser.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import Foundation

class VKServicesProvider {
    
    // MARK: - Types

    typealias ResultCompletion = (Result<VKServicesResponseData, Error>) -> ()
    
    // MARK: - Static Properties

    private static let url = URL(string: "https://mobile-olympiad-trajectory.hb.bizmrg.com/semi-final-data.json")
    
    // MARK: - Public Methods
    
    func getInfo(completion: @escaping ResultCompletion) {
        guard let url = Self.url else {
            return
        }
        var retryCount = 5
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                retryCount -= 1
                if retryCount > 0 {
                    self.getInfo(completion: completion)
                } else {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
                return
            }
            guard let data else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(VKServicesResponseData.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            }  catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
