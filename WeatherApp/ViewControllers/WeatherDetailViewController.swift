//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by T-Mobile on 19/12/20.
//

import UIKit

class WeatherDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var weatherDetailsTableView: UITableView!
    var weatherList: List? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherDetailsTableView.register(UINib(nibName: "WeatherDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherDetailTableViewCell")
        
        self.weatherDetailsTableView.register(UINib(nibName: "TemperaturePressureTableViewCell", bundle: nil), forCellReuseIdentifier: "TemperaturePressureTableViewCell")
        
        self.weatherDetailsTableView.register(UINib(nibName: "WindDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "WindDetailsTableViewCell")
        
        self.title = weatherList?.name
    }
    
}

extension WeatherDetailViewController {
    // MARK: -  Tableview Delegate and Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherDetailTableViewCell", for: indexPath) as! WeatherDetailTableViewCell
            
            cell.updateDetailsWith(iconImageUrl: weatherList!.imageUrl, degree: weatherList?.temprautre, city: weatherList?.name, weatherConditionDescription: weatherList?.weatherConditionDescription, feelsLike: weatherList?.feelsLike)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TemperaturePressureTableViewCell", for: indexPath) as! TemperaturePressureTableViewCell
            
            cell.updateDetailsWith(temperatureRange: weatherList?.temperatureRange, pressure: weatherList?.pressure, humidity: weatherList?.humidity)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WindDetailsTableViewCell", for: indexPath) as! WindDetailsTableViewCell
            
            cell.updateDetailsWith(windSpeed: weatherList?.windSpeed, windDirection: weatherList?.windDirection)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 210.0
        } else if indexPath.row == 1 {
            return 160.0
        }
        
        return 117.0
        
    }
}
