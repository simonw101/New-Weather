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
        
        dateLabel.text = getDate()
        
        timeLabel.text = getTime()
        
        getWeather(url: url)
        
        navigationController?.popViewController(animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        dateLabel.text = getDate()
        timeLabel.text = getTime()
        
        getWeather(url: url)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getWeather(url: url)
        dateLabel.text = getDate()
        timeLabel.text = getTime()
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
                                    
                                    self.currentWeatherObject = self.parseData.currently(jsonData: currentWeather)
                                    
                                    self.descriptionLabel.text = self.currentWeatherObject.description
                                    
                                    self.tempLabel.text = "\(Int(self.currentWeatherObject.temp))°C"
                                    
                                    self.sunriseLabel.text = "\(self.currentWeatherObject.sunrise)/\(self.currentWeatherObject.sunset)"
                                    
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
        
        getWeather(url: url)
        
        getLocation(location: locations[0])
        
    }
    
    func getDate() -> String{
        
        let date = Date()
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "EEEE MMMM YYYY"
        
        let result = formatter.string(from: date)
        
        return result
        
    }
    
    
    func getTime() -> String{
        
        let date = Date()
        
        let formatter = DateFormatter()
        
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
}

