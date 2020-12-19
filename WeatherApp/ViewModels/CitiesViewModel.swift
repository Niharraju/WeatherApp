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

extension list {
    var city: String {
        return name
    }
    
    var temprautre: String {
        return String(Int(main.temp)) + "˚"
    }
    
    var imageUrl: URL {
        let url = URL.init(string: "http://openweathermap.org/img/wn/\(weather[0].icon)@2x.png")
        return url!
    }
}

extension CitiesViewModel {
    func weatherList(atIndex index: Int) -> list {
        return (weathers?.list[index])!
    }
}

extension UIImageView {
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
