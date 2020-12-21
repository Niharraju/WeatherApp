//
//  Weather.swift
//  WeatherApp
//
//  Created by T-Mobile on 17/12/20.
//

import Foundation

struct Weather: Codable {
    let list:[List]
}

struct List: Codable {
    let weather: [weatherDetails]
    let main: Main
    let name: String
    let id: Int
    let wind: Wind
}

struct weatherDetails: Codable {
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Double
}

struct Wind: Codable {
    let speed: Double
    let deg: Double
}
