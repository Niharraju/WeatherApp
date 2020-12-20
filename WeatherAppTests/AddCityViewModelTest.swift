//
//  AddCityViewModelTest.swift
//  WeatherAppTests
//
//  Created by T-Mobile on 20/12/20.
//

import XCTest
@testable import WeatherApp

class AddCityViewModelTest: XCTestCase {
    
    let addCityViewModel = AddCityViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetchCitiesListFromJson() {
        let fetchCitiesExpectation = expectation(description: "Fecthing cities from json file is successful")
        self.addCityViewModel.fetchCitiesListFromJson { (success) in
            if success {
                fetchCitiesExpectation.fulfill()
            } else {
                XCTFail("Failed to fetch cities from json")
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testFilterCities() {
        let filterCitiesExpectation = expectation(description: "Cities filtered successfully")
        self.addCityViewModel.fetchCitiesListFromJson { (success) in
            if success {
                self.addCityViewModel.filterCities(withInput: "sydney") { (cities) in
                    if cities.count > 0 {
                        filterCitiesExpectation.fulfill()
                    } else {
                        XCTFail("Failed to filtered cities")
                    }
                }
            } else {
                XCTFail("Failed to fetch cities from json")
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}
