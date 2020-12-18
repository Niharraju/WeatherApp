//
//  City.swift
//  WeatherApp
//
//  Created by T-Mobile on 17/12/20.
//

import Foundation

struct City: Codable {
    let id: Int
    let name: String
    let state: String?
    let country: String?
}

struct Cities: Codable {
    let cities:[City]
}
