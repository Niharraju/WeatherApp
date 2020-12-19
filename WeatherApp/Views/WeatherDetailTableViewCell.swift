//
//  WeatherDetailTableViewCell.swift
//  WeatherApp
//
//  Created by T-Mobile on 19/12/20.
//

import UIKit

class WeatherDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherConditionDescriptionLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.cornerRadius = 15
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
