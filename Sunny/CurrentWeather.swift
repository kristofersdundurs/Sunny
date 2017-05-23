//  Sunny
//
//  Created by Kristofers Dundurs on 10/04/2017.
//  Copyright © 2017 Kristofers Dundurs. All rights reserved.
//


//Get phone's GPS coordinates and use them to make an API call
//Create variables for wind, humidity and barometric pressure

//Create .swift file and new class for 10 day forecast
//Form variables for 10 day forecast
//Assign forecast variables to TableView cells


import Foundation
import Alamofire


class CurrentWeather {

    var _currentDate: String!
    var _temperature: Double!
    var _apparentTemperature: Double!
    var _weatherType: String!
    var _wind: Double!
    var _pressure: Double!
    var _humidity: Double!
    
    var date: String {
        if _currentDate == nil {
            _currentDate = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let currentDate = dateFormatter.string(from: Date())
        self._currentDate = "\(currentDate)"
        return _currentDate
    }
    
    var temperature: Double {
        if _temperature == nil {
            _temperature = 0.0
        }
        return _temperature
    }
    
    var apparentTemperature: Double {
        if _apparentTemperature == nil {
            _apparentTemperature = 0
        }
        return _apparentTemperature
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        } else if _weatherType == "clouds" {
            _weatherType = "cloudy"
        }
        return _weatherType.capitalized
    }
    
    var wind: Double {
        if _wind == nil {
            _wind = 0
        }
        return _wind
    }
    
    var pressure: Double {
        if _pressure == nil {
            _pressure = 0
        }
        return _pressure
    }
    
    var humidity: Double {
        if _humidity == nil {
            _humidity = 0
        }
        return _humidity
    }
    
    func getCurrentWeather(completed: @escaping DownloadComplete) {
        let testURL = URL(string: CURRENT_API_CALL)!
        Alamofire.request(testURL).responseJSON { response in
        let result = response.result
            if let JSON = result.value as? Dictionary <String, AnyObject> {
                if let curr = JSON["currently"] as? Dictionary <String, AnyObject> {
                    if let summary = curr["summary"] as? String {
                        self._weatherType = summary.capitalized
                        self._weatherType = summary.capitalized
                        print(summary)
                        print(self.weatherType)
                    }
                    if let temperature = curr["temperature"] as? Double {
                        self._temperature = temperature
                        print(temperature)
                    }
                    if let apparentTemperature = curr["apparentTemperature"] as? Double {
                        self._apparentTemperature = apparentTemperature
                        print(apparentTemperature)
                    }
                    if let windSpeed = curr["windSpeed"] as? Double {
                        self._wind = windSpeed
                        print(windSpeed)
                    }
                    if let pressure = curr["pressure"] as? Double {
                        self._pressure = pressure
                    }
                    if let humidity = curr["humidity"] as? Double {
                        self._humidity = humidity
                    }
                    
                    }
                    }
                        completed()
                }
        }
    }
