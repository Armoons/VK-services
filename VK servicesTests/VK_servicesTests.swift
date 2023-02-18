//
//  VK_servicesTests.swift
//  VK servicesTests
//
//  Created by Stepanyan Arman  on 17.02.2023.
//

import XCTest
@testable import VK_services

final class VK_servicesTests: XCTestCase {
    
    private var serviceProvider: VKServicesProvider!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        serviceProvider = VKServicesProvider()
    }

    override func tearDownWithError() throws {
        serviceProvider = nil
        
        try super.tearDownWithError()
    }
    
    func testResponse() {
        let expectation = expectation(description: "Expectation")
        
        serviceProvider.getInfo { result in
            switch result {
            case let .success(data):
                let responseNames = data.items.map(\.name)
                print(data.items.map(\.serviceURL))
                let successResultNames = [
                    "ВКонтакте",
                    "Одноклассники",
                    "Сферум",
                    "GeekBrains",
                    "SkillFactory",
                    "Почта",
                    "Облако",
                    "Календарь"
                ]
                XCTAssertEqual(responseNames, successResultNames)
            case let .failure(error):
                print(error)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
}
