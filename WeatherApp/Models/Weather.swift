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
}

struct weather: Codable {
    let main: String
    let description: String
    let icon: String
}

struct main: Codable {
    let temp: Double
}
