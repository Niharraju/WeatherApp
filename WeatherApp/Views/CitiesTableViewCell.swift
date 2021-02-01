//
//  CitiesTableViewCell.swift
//  WeatherApp
//
//  Created by T-Mobile on 17/12/20.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateDetailsWith(weatherIconImageUrl: URL, city: String?, temperature: String?) {
        cityLabel.text = city
        temperatureLabel.text = temperature
        weatherIconImageView.load(url: weatherIconImageUrl)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
