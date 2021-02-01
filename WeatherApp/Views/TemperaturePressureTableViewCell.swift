//
//  TemperaturePressureTableViewCell.swift
//  WeatherApp
//
//  Created by T-Mobile on 19/12/20.
//

import UIKit

class TemperaturePressureTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var temperatureRangeLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 15
    }
    
    func updateDetailsWith(temperatureRange: String?, pressure: String?, humidity: String?) {
        temperatureRangeLabel.text = temperatureRange
        pressureLabel.text = pressure
        humidityLabel.text = humidity
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
