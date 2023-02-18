//
//  VKServicesResponseData.swift
//  VK services
//
//  Created by Stepanyan Arman  on 17.02.2023.
//


struct VKServicesResponseData: Codable {
    
    let items: [VKServiceItem]
}

struct VKServiceItem: Codable {
    
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
