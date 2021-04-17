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
    
    func daily(jsonData: [String: Any]) -> [ForecastModel] {
        
        var dailyWeather = ForecastModel()
        
        var dailyForecastArray = [ForecastModel]()
        
        if let jsonDailyWeather = jsonData["daily"] as? [Any] {

            for dailyWeatherArray in jsonDailyWeather {
                
                if let weather = dailyWeatherArray as? [String: Any] {
                    
                    if let dailyHumidity = weather["humidity"] as? Int {
                        
                        dailyWeather.humidity.append(dailyHumidity)
                        
                        if let minTempArray = weather["temp"] as? [String: Any] {
                            
                            if let min = minTempArray["min"] as? Double {
                                
                                dailyWeather.minTemp.append(min)
                                
                                if let maxTempArray = weather["temp"] as? [String: Any] {
                                    
                                    if let max = maxTempArray["max"] as? Double {
                                        
                                        dailyWeather.maxTemp.append(max)
                                        
                                        
                                        if let timeStamp = weather["dt"] as? Int {
                                            
                                           let result = getDayOfTheWeek(timeStamp: timeStamp)
                                            
                                            dailyWeather.dayOfWeek.append(result)
                                            
                                            if let pressureData = weather["pressure"] as? Int {
                                                
                                                dailyWeather.pressure.append(pressureData)
                                                
                                                if let descriptionData = weather["weather"] as? [Any] {
                                                    
                                                    if let descriptionDict = descriptionData[0] as? [String: Any] {
                                                        
                                                        if let description = descriptionDict["description"] as? String {
                                                            
                                                            dailyWeather.description.append(description)
                                                            
                                                            if let iconData = weather["weather"] as? [Any] {
                                                                
                                                                if let iconDict = iconData[0] as? [String: Any] {
                                                                    
                                                                    if let iconId = iconDict["id"] as? Int {
                                                                        
                                                                        dailyWeather.iconID.append(iconId)
                                                                        
                                                                    }
                                                                    
                                                                }
                                                                
                                                            }
                                                            
                                                        }
                                                        
                                                    }
                                                    
                                                }
                                                
                                            }
                                            
                                        }

                                        
                                    }
                                    
                                }
                                
                                
                                
                            }
                                
                            
                            }
                        
                    }
                    
                    
                    
                }
                
                
            }
           
        }
        
        dailyForecastArray.append(dailyWeather)
        
        
        return dailyForecastArray
        
    }
    
    func sunriseandSunset(timeStamp: Int) -> String {
        
        let timeInterval = TimeInterval(timeStamp)
        
        let date = Date(timeIntervalSince1970: timeInterval)
        
        let formatter = DateFormatter()
        
        formatter.timeZone = .current
        
        formatter.dateFormat = "HH:mm"
        
        let result = formatter.string(from: date)
        
        return result
        
    }
    
    func getDayOfTheWeek(timeStamp: Int) -> String {
        
        let timeInterval = TimeInterval(timeStamp)
        
        let date = Date(timeIntervalSince1970: timeInterval)
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "EEEE"
        
        let result = formatter.string(from: date)
        
        return result
        
    }
    
    
    
}


