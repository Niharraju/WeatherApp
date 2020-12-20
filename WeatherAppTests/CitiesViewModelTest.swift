//
//  CitiesViewModelTest.swift
//  WeatherAppTests
//
//  Created by T-Mobile on 20/12/20.
//

import XCTest
@testable import WeatherApp

class CitiesViewModelTest: XCTestCase {
    
    let citiesViewModel = CitiesViewModel()

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
    
    func testCallService() {
        let callServiceExpectation = expectation(description: "API call successful")
        self.citiesViewModel.callService { result in
            switch result {
                case .success( _):
                    callServiceExpectation.fulfill()
                case .failure( _):
                    XCTFail("API call failed")
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testLoadImageUrl() {
        let loadImageExpectation = expectation(description: "Image loaded successfully")
        let imageView  = UIImageView()
        //imageView.image
        let url = URL(string: "http://openweathermap.org/img/wn/10d@2x.png")
        imageView.load(url: url!)
        
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            if imageView.image != nil {
                loadImageExpectation.fulfill()
            } else {
                XCTFail("Failed to load image")
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testWeatherList() {
        let weatherListExpectation = expectation(description: "")
        
        self.citiesViewModel.callService { result in
            switch result {
                case .success( _):
                    let list = self.citiesViewModel.weatherList(atIndex: 0)
                    if list.city == "Sydney" {
                        weatherListExpectation.fulfill()
                    } else {
                        XCTFail("Failed weather list")
                    }
                case .failure( _):
                    XCTFail("API call failed")
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}
