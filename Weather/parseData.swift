//
//  parseData.swift
//  Weather
//
//  Created by Simon Wilson on 08/03/2021.
//

import UIKit

class ParseData {
    
    func currently(jsonData: [String: Any]) -> CurrentWeatherObject {
        
        let currentweatherObj = CurrentWeatherObject()
        
        if let jsonCurrentWeather = jsonData["current"] as? [String: Any] {
            
            if let sunrise = jsonCurrentWeather["sunrise"] as? Int {
                
                currentweatherObj.sunrise = sunriseandSunset(timeStamp: sunrise)
      
            }
            
            if let sunset = jsonCurrentWeather["sunset"] as? Int {
                
                
                currentweatherObj.sunset = sunriseandSunset(timeStamp: sunset)
                
                
            }
            
            if let temp = jsonCurrentWeather["temp"] as? Double {
                
                currentweatherObj.temp = temp
                
            }
            
            if let weather = jsonCurrentWeather["weather"] as? [Any] {
                
                if let obj = weather[0] as? [String: Any] {
                    
                    if let id = obj["id"] as? Int {
                        
                        currentweatherObj.id = id
                        
                    }
                    
                }
                
                if let weather = jsonCurrentWeather["weather"] as? [Any] {
                    
                    if let description = weather[0] as? [String: Any] {
                        
                        if let descriptionData = description["description"] as? String {
                            
                            
                            currentweatherObj.description = descriptionData
                            
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
        return currentweatherObj
        
    }
    
    func sunriseandSunset(timeStamp: Int) -> String {
        
        let timeInterval = TimeInterval(timeStamp)
        
        let date = Date(timeIntervalSince1970: timeInterval)
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm"
        
        let result = formatter.string(from: date)
        
        return result
        
    }
    
    
    
}


