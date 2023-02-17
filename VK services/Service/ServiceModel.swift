//
//  ServicesModel.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//


struct Services: Codable {
    let items: [Item]
}

struct Item: Codable {
    let name: String
    let description: String
    let iconURL: String
    let serviceURL: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case iconURL = "icon_url"
        case serviceURL = "service_url"
    }
}
