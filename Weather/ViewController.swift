//
//  ViewController.swift
//  Weather
//
//  Created by Simon Wilson on 03/03/2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var url = ""
    
    var locationManager = CLLocationManager()
    
    var currentWeatherObject = CurrentWeatherObject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func getWeather(url: String) {
        
        if let url = URL(string: url) {
            
            let session =  URLSession.shared
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if let errorMessage = error  {
                    
                    print(errorMessage.localizedDescription)
                    
                } else {
                    
                    if let data = data {
                        
                        do {
                            
                            let parsedJsonData = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                            
                            
                            if let currentWeather = parsedJsonData as? [String : Any] {
                                
                                if let json = currentWeather["current"] as? [String: Any] {
                                    
                                    if let sunrise = json["sunrise"] as? Int {
                                        
                                        //print(sunrise)
                                        
                                        self.currentWeatherObject.sunrise = sunrise
                                        
                                    }
                                    
                                    if let sunset = json["sunset"] as? Int {
                                        
                                        //print(sunset)
                                        
                                        self.currentWeatherObject.sunset = sunset
                                        
                                    }
                                    
                                    if let temp = json["temp"] as? Double {
                                        
                                        //print(temp)
                                        
                                        self.currentWeatherObject.temp = temp
                                        
                                    }
                                    
                                    if let pressure = json["pressure"] as? Int {
                                        
                                        //print(pressure)
                                        
                                        self.currentWeatherObject.pressure = pressure
                                        
                                    }
                                    
                                    if let humidity = json["humidity"] as? Int {
                                        
                                        //print(humidity)
                                        
                                        self.currentWeatherObject.humidity = humidity
                                        
                                    }
                                    
                                    if let clouds = json["clouds"] as? Int {
                                        
                                        //print(clouds)
                                        
                                        self.currentWeatherObject.clouds = clouds
                                        
                                    }
                                    
                                    if let visibility = json["visibility"] as? Int {
                                        
                                       // print(visibility)
                                        
                                        self.currentWeatherObject.visibility = visibility
                                        
                                    }
                        
                                    if let windSpeed = json["wind_speed"] as? Double {
                                        
                                        //print(windSpeed)
                                        
                                        self.currentWeatherObject.windSpeed = windSpeed
                                        
                                    }
                                    
                                    if let weather = json["weather"] as? [Any] {
                                        
                                        if let obj = weather[0] as? [String: Any] {
                                            
                                            if let id = obj["id"] as? Int {
                                                
                                                //print(id)
                                                
                                                self.currentWeatherObject.id = id
                                                
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                    print(self.currentWeatherObject.id)
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
        
    }
}

