//
//  WindDetailsTableViewCell.swift
//  WeatherApp
//
//  Created by T-Mobile on 19/12/20.
//

import UIKit

class WindDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 15
        windSpeedLabel.adjustsFontSizeToFitWidth = true
    }
    
    func updateDetailsWith(windSpeed: String?, windDirection: String?) {
        windSpeedLabel.text = windSpeed
        windDirectionLabel.text = windDirection
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
