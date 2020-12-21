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
            cell.cityLabel.text = weatherList?.name
            cell.degreeLabel.text = weatherList?.temprautre
            cell.weatherIconImageView.load(url: weatherList!.imageUrl)
            cell.feelsLikeLabel.text = weatherList?.feelsLike
            cell.weatherConditionDescriptionLabel.text = weatherList?.weatherConditionDescription
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TemperaturePressureTableViewCell", for: indexPath) as! TemperaturePressureTableViewCell
            cell.temeratureRangeLabel.text = weatherList?.temperatureRange
            cell.pressureLabel.text = weatherList?.pressure
            cell.humidityLabel.text = weatherList?.humidity
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WindDetailsTableViewCell", for: indexPath) as! WindDetailsTableViewCell
            cell.windSpeedLabel.text = weatherList?.windSpeed
            cell.windDirectionLabel.text = weatherList?.windDirection
            
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
