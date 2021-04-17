//
//  ViewController.swift
//  Weather
//
//  Created by Simon Wilson on 03/03/2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var parseData = ParseData()
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var sunriseLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    var url = ""
    
    var geocoder = CLGeocoder()
    
    var locationManager = CLLocationManager()
    
    var currentWeatherObject = CurrentWeatherObject()
    
    var forecastArray = [ForecastModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        dateLabel.text = getDate()
        
        timeLabel.text = getTime()
        
        navigationController?.popViewController(animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dateLabel.text = getDate()
        timeLabel.text = getTime()
        
        getWeather(url: url)
        
        print("called")
    }
    
    @IBAction func refreshClicked(_ sender: Any) {
        
        dateLabel.text = getDate()
        timeLabel.text = getTime()
        
        getWeather(url: url)
        
    }
    
    @objc func getWeather(url: String) {
        
        dateLabel.text = getDate()
        timeLabel.text = getTime()
        
        //print("called")
        
        if let url = URL(string: url) {
            
            let session =  URLSession.shared
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if let errorMessage = error  {
                    
                    print(errorMessage.localizedDescription)
                    
                } else {
                    
                    if let data = data {
                        
                        do {
                            
                            let parsedJsonData = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                            
                            DispatchQueue.main.async {
                                
                                if let currentWeather = parsedJsonData as? [String : Any] {
                                    
                                    // current weather
                                    self.currentWeatherObject = self.parseData.currently(jsonData: currentWeather)
                                    
                                    self.descriptionLabel.text = self.currentWeatherObject.description
                                    
                                    self.tempLabel.text = "\(Int(self.currentWeatherObject.temp))°"
                                    
                                    self.sunriseLabel.text = "\(self.currentWeatherObject.sunrise)/\(self.currentWeatherObject.sunset)"
                                    
                                    // write icon id to update icon image
                                    
                                    if self.currentWeatherObject.id == 800 {
                                        
                                        self.iconImage.image = UIImage(named: "day_clear")
                                        
                                    } else if self.currentWeatherObject.id == 801 {
                                        
                                        self.iconImage.image = UIImage(named: "day_partial_cloud")
                                        
                                    }else if self.currentWeatherObject.id == 802 {
                                        
                                        self.iconImage.image = UIImage(named: "day_partial_cloud")
                                        
                                    }else if self.currentWeatherObject.id == 803 {
                                        
                                        self.iconImage.image = UIImage(named: "day_partial_cloud")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 804 {
                                        
                                        self.iconImage.image = UIImage(named: "day_partial_cloud")
                                        
                                    }
                                    
                                    else if self.currentWeatherObject.id == 701 {
                                        
                                        self.iconImage.image = UIImage(named: "mist")
                                        
                                    }
                                    
                                    else if self.currentWeatherObject.id == 741 {
                                        
                                        self.iconImage.image = UIImage(named: "fog")
                                        
                                    }
                                    
                                    else if self.currentWeatherObject.id == 600 {
                                        
                                        self.iconImage.image = UIImage(named: "snow")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 601 {
                                        
                                        self.iconImage.image = UIImage(named: "snow")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 602 {
                                        
                                        self.iconImage.image = UIImage(named: "snow")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 611 {
                                        
                                        self.iconImage.image = UIImage(named: "snow")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 612 {
                                        
                                        self.iconImage.image = UIImage(named: "snow")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 613 {
                                        
                                        self.iconImage.image = UIImage(named: "snow")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 615 {
                                        
                                        self.iconImage.image = UIImage(named: "snow")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 616 {
                                        
                                        self.iconImage.image = UIImage(named: "snow")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 620 {
                                        
                                        self.iconImage.image = UIImage(named: "snow")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 621 {
                                        
                                        self.iconImage.image = UIImage(named: "snow")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 622 {
                                        
                                        self.iconImage.image = UIImage(named: "snow")
                                        
                                    }
                                    
                                    else if self.currentWeatherObject.id == 500 {
                                        
                                        self.iconImage.image = UIImage(named: "rain")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 501 {
                                        
                                        self.iconImage.image = UIImage(named: "rain")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 502 {
                                        
                                        self.iconImage.image = UIImage(named: "rain")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 503 {
                                        
                                        self.iconImage.image = UIImage(named: "rain")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 504 {
                                        
                                        self.iconImage.image = UIImage(named: "rain")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 511 {
                                        
                                        self.iconImage.image = UIImage(named: "rain")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 520 {
                                        
                                        self.iconImage.image = UIImage(named: "v")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 521 {
                                        
                                        self.iconImage.image = UIImage(named: "rain")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 522 {
                                        
                                        self.iconImage.image = UIImage(named: "rain")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 531 {
                                        
                                        self.iconImage.image = UIImage(named: "rain")
                                        
                                    }
                                    
                                    else if self.currentWeatherObject.id == 300 {
                                        
                                        self.iconImage.image = UIImage(named: "day_rain")
                                        
                                    }
                                    
                                    else if self.currentWeatherObject.id == 301 {
                                        
                                        self.iconImage.image = UIImage(named: "day_rain")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 302 {
                                        
                                        self.iconImage.image = UIImage(named: "day_rain")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 310 {
                                        
                                        self.iconImage.image = UIImage(named: "day_rain")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 311 {
                                        
                                        self.iconImage.image = UIImage(named: "day_rain")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 312 {
                                        
                                        self.iconImage.image = UIImage(named: "day_rain")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 313 {
                                        
                                        self.iconImage.image = UIImage(named: "day_rain")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 314 {
                                        
                                        self.iconImage.image = UIImage(named: "day_rain")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 321 {
                                        
                                        self.iconImage.image = UIImage(named: "day_rain")
                                        
                                    }
                                    
                                    else if self.currentWeatherObject.id == 200 {
                                        
                                        self.iconImage.image = UIImage(named: "thunder")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 201 {
                                        
                                        self.iconImage.image = UIImage(named: "thunder")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 202 {
                                        
                                        self.iconImage.image = UIImage(named: "thunder")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 210 {
                                        
                                        self.iconImage.image = UIImage(named: "thunder")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 211 {
                                        
                                        self.iconImage.image = UIImage(named: "thunder")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 212 {
                                        
                                        self.iconImage.image = UIImage(named: "thunder")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 221 {
                                        
                                        self.iconImage.image = UIImage(named: "thunder")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 230 {
                                        
                                        self.iconImage.image = UIImage(named: "thunder")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 231 {
                                        
                                        self.iconImage.image = UIImage(named: "thunder")
                                        
                                    }
                                    else if self.currentWeatherObject.id == 232 {
                                        
                                        self.iconImage.image = UIImage(named: "thunder")
                                        
                                    }
                                    
                                    //update userdefaults here 
                                    
                                    //forecast data 8 days
                                    self.forecastArray =  self.parseData.daily(jsonData: currentWeather)
                                    
                                   
                                }
                            }
                            
                        } catch {
                            
                            print("unable to parse json")
                            
                        }
                        
                    }
                    
                }
                
            }
            
            task.resume()
            
        }
      
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let latitude = locations[0].coordinate.latitude
        let longitude = locations[0].coordinate.longitude
        
        url = "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&units=metric&exclude=hourly,minutely&appid=5395ac65622d176519bdd00654f3331f"
        
        print(url)
        
        getWeather(url: url)
        
        getLocation(location: locations[0])
        
    }
    
    func getDate() -> String{
        
        let date = Date()
        
        let formatter = DateFormatter()
        
        formatter.timeZone = .current
        
        formatter.dateFormat = "EEEE MMMM YYYY"
        
        let result = formatter.string(from: date)
        
        return result
        
    }
    
    
    func getTime() -> String{
        
        let date = Date()
        
        let formatter = DateFormatter()
        
        formatter.timeZone = .current
        
        formatter.dateFormat = "HH:mm"
        
        let result = formatter.string(from: date)
        
        return result
        
    }
    
    func getLocation(location: CLLocation) {
        
        let myLocation = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        geocoder.reverseGeocodeLocation(myLocation) { (placemarks, error) in
            
            if let placemark = placemarks {
                
                if let city = placemark[0].locality {
                    
                    self.locationLabel.text = "\(city)"
                    //print(city)
                    
                }
                
            }
            
        }
        
    }
    
    @IBAction func forecastButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toForecastListView", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toForecastListView" {
            
            if let forcastVC = segue.destination as? ForecastListViewViewController {
                
                forcastVC.forecastDataArray = forecastArray
                
            }
            
        }
    }
}

