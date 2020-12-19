//
//  Weather.swift
//  WeatherApp
//
//  Created by T-Mobile on 17/12/20.
//

import Foundation

struct Weather: Codable {
    let list:[list]
}

struct list: Codable {
    let weather: [weather]
    let main: main
    let name: String
    let id: Int
    let wind: Wind
}

struct weather: Codable {
    let main: String
    let description: String
    let icon: String
}

struct main: Codable {
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
