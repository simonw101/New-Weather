//
//  ForecastListViewViewController.swift
//  Weather
//
//  Created by Simon Wilson on 04/03/2021.
//

import UIKit

class ForecastListViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var forecatTableView: UITableView!
    
    var forecastDataArray = [ForecastModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecatTableView.delegate = self
        forecatTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastDataArray[0].dayOfWeek.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! WeatherTableViewCell
        cell.dayLabel.text = forecastDataArray[0].dayOfWeek[indexPath.row]
        
        if forecastDataArray[0].iconID[indexPath.row] == 800 {
            
            cell.iconImageViewCell.image = UIImage(named: "day_clear")
            
        } else if forecastDataArray[0].iconID[indexPath.row] == 801 {
            
            cell.iconImageViewCell.image = UIImage(named: "day_partial_cloud")
            
        }else if forecastDataArray[0].iconID[indexPath.row] == 802 {
            
            cell.iconImageViewCell.image = UIImage(named: "day_partial_cloud")
            
        }else if forecastDataArray[0].iconID[indexPath.row] == 803 {
            
            cell.iconImageViewCell.image = UIImage(named: "day_partial_cloud")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 804 {
            
            cell.iconImageViewCell.image = UIImage(named: "day_partial_cloud")
            
        }
        
        else if forecastDataArray[0].iconID[indexPath.row] == 701 {
            
            cell.iconImageViewCell.image = UIImage(named: "mist")
            
        }
        
        else if forecastDataArray[0].iconID[indexPath.row] == 741 {
            
            cell.iconImageViewCell.image = UIImage(named: "fog")
            
        }
        
        else if forecastDataArray[0].iconID[indexPath.row] == 600 {
            
            cell.iconImageViewCell.image = UIImage(named: "snow")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 601 {
            
            cell.iconImageViewCell.image = UIImage(named: "snow")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 602 {
            
            cell.iconImageViewCell.image = UIImage(named: "snow")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 611 {
            
            cell.iconImageViewCell.image = UIImage(named: "snow")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 612 {
            
            cell.iconImageViewCell.image = UIImage(named: "snow")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 613 {
            
            cell.iconImageViewCell.image = UIImage(named: "snow")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 615 {
            
            cell.iconImageViewCell.image = UIImage(named: "snow")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 616 {
            
            cell.iconImageViewCell.image = UIImage(named: "snow")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 620 {
            
            cell.iconImageViewCell.image = UIImage(named: "snow")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 621 {
            
            cell.iconImageViewCell.image = UIImage(named: "snow")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 622 {
            
            cell.iconImageViewCell.image = UIImage(named: "snow")
            
        }
        
        else if forecastDataArray[0].iconID[indexPath.row] == 500 {
            
            cell.iconImageViewCell.image = UIImage(named: "rain")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 501 {
            
            cell.iconImageViewCell.image = UIImage(named: "rain")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 502 {
            
            cell.iconImageViewCell.image = UIImage(named: "rain")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 503 {
            
            cell.iconImageViewCell.image = UIImage(named: "rain")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 504 {
            
            cell.iconImageViewCell.image = UIImage(named: "rain")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 511 {
            
            cell.iconImageViewCell.image = UIImage(named: "rain")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 520 {
            
            cell.iconImageViewCell.image = UIImage(named: "v")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 521 {
            
            cell.iconImageViewCell.image = UIImage(named: "rain")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 522 {
            
            cell.iconImageViewCell.image = UIImage(named: "rain")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 531 {
            
            cell.iconImageViewCell.image = UIImage(named: "rain")
            
        }
        
        else if forecastDataArray[0].iconID[indexPath.row] == 300 {
            
            cell.iconImageViewCell.image = UIImage(named: "day_rain")
            
        }
        
        else if forecastDataArray[0].iconID[indexPath.row] == 301 {
            
            cell.iconImageViewCell.image = UIImage(named: "day_rain")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 302 {
            
            cell.iconImageViewCell.image = UIImage(named: "day_rain")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 310 {
            
            cell.iconImageViewCell.image = UIImage(named: "day_rain")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 311 {
            
            cell.iconImageViewCell.image = UIImage(named: "day_rain")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 312 {
            
            cell.iconImageViewCell.image = UIImage(named: "day_rain")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 313 {
            
            cell.iconImageViewCell.image = UIImage(named: "day_rain")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 314 {
            
            cell.iconImageViewCell.image = UIImage(named: "day_rain")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 321 {
            
            cell.iconImageViewCell.image = UIImage(named: "day_rain")
            
        }
        
        else if forecastDataArray[0].iconID[indexPath.row] == 200 {
            
            cell.iconImageViewCell.image = UIImage(named: "thunder")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 201 {
            
            cell.iconImageViewCell.image = UIImage(named: "thunder")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 202 {
            
            cell.iconImageViewCell.image = UIImage(named: "thunder")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 210 {
            
            cell.iconImageViewCell.image = UIImage(named: "thunder")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 211 {
            
            cell.iconImageViewCell.image = UIImage(named: "thunder")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 212 {
            
            cell.iconImageViewCell.image = UIImage(named: "thunder")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 221 {
            
            cell.iconImageViewCell.image = UIImage(named: "thunder")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 230 {
            
            cell.iconImageViewCell.image = UIImage(named: "thunder")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 231 {
            
            cell.iconImageViewCell.image = UIImage(named: "thunder")
            
        }
        else if forecastDataArray[0].iconID[indexPath.row] == 232 {
            
            cell.iconImageViewCell.image = UIImage(named: "thunder")
            
        }
        
        let min = forecastDataArray[0].minTemp[indexPath.row]
        
        let max = forecastDataArray[0].maxTemp[indexPath.row]
        
        cell.minmaxLabel.text = "\(Int(min))°C/\(Int(max))°C"
        
        cell.descriptionLabel.text = forecastDataArray[0].description[indexPath.row]
        
        cell.pressureLabel.text = "\(forecastDataArray[0].pressure[indexPath.row])"
        
        cell.humidityLabel.text = "\(forecastDataArray[0].humidity[indexPath.row])%"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 275.0
    }
    
}
