//
//  CitiesViewmodel.swift
//  WeatherApp
//
//  Created by T-Mobile on 17/12/20.
//

import Foundation
import  UIKit

class CitiesViewModel {
    
    var weathers: Weather?
    
    func callService(completion: @escaping (Result<Any, Error>) -> Void) {
        let service = WebService()
        let urlString = "http://api.openweathermap.org/data/2.5/group?id=524901,703448,2643743&units=metric&appid=872217b68ce12d774637a3f269e9486b"
        service.getWeather(from: urlString) { result in
            switch result {
                case .success(let orders):
                    let result = try? JSONDecoder().decode(Weather.self, from: orders)
                    if let result = result {
                        DispatchQueue.main.async {
                            //completion(.success(result))
                            print("result =====>\(result)")
                            self.weathers = result
                            completion(.success(true))
                        }
                    } else {
                        //completion(.failure(.decodingError))
                        completion(.failure("" as! Error))
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}

extension list {
    var city: String {
        return name
    }
    
    var temprautre: String {
        return String(Int(main.temp)) + "˚"
    }
}

extension CitiesViewModel {
    func weatherList(atIndex index: Int) -> list {
        return (weathers?.list[index])!
    }
}
