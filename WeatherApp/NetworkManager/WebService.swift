//
//  WebService.swift
//  WeatherApp
//
//  Created by T-Mobile on 17/12/20.
//

import Foundation

class WebService {
    
    func getWeather(from url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: url) {
            URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                if let data = data {
                    completion(.success(data))
                }
            }.resume()
        }
    }
    
}
