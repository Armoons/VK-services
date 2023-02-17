//
//  Parser.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import Foundation

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
}
