//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by Simon Wilson on 22/03/2021.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageViewCell: UIImageView!
    
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var minmaxLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
