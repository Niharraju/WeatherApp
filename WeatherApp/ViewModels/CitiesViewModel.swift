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
    var citiesId = [2147714, 2642801, 2174003]
    
    func callService(completion: @escaping (Result<Any, Error>) -> Void) {
        let service = WebService()
        let urlString = "http://api.openweathermap.org/data/2.5/group?id=\(citiesId.map({"\($0)"}).joined(separator: ","))&units=metric&appid=872217b68ce12d774637a3f269e9486b"
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

extension List {
    var city: String {
        return name
    }
    
    var temprautre: String {
        return String(Int(main.temp)) + "˚c"
    }
    
    var imageUrl: URL {
        let url = URL.init(string: "http://openweathermap.org/img/wn/\(weather[0].icon)@2x.png")
        return url!
    }
    
    var weatherConditionDescription: String {
        return weather[0].description
    }
    
    var feelsLike: String {
        return "Feels Like: " + String(Int(main.feels_like)) + "˚c"
    }
    
    var temperatureRange: String {
        return "\(Int(main.temp_min))˚c - \(Int(main.temp_max))˚c"
    }
    
    var pressure: String {
        return String(main.pressure) + " hPa"
    }
    
    var humidity: String {
        return String(main.humidity) + "%"
    }
    
    var windSpeed: String {
        return String(wind.speed) + " meter/sec"
    }
    
    var windDirection: String {
        return String(wind.deg) + "˚"
    }
}

extension CitiesViewModel {
    func weatherList(atIndex index: Int) -> List {
        return (weathers?.list[index])!
    }
}

extension UIImageView {
    //Load image from url and display in imageview
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
