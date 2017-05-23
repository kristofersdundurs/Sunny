//
//  ForecastWeather.swift
//  Sunny
//
//  Created by Kristofers Dundurs on 22/05/2017.
//  Copyright © 2017 Kristofers Dundurs. All rights reserved.
//

import UIKit
import Alamofire


class ForecastWeather {
    var forecastData = [ForecastWeather]()
    var _date: String!
    var _weathertype: String!
    var _highTemp: Double!
    var _lowTemp: Double!
    
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weathertype == nil {
            _weathertype = ""
        }
        return _weathertype
    }
    
    var highTemp: Double {
        if _highTemp == nil {
            _highTemp = 0
        }
        return _highTemp
    }
    
    var lowTemp: Double {
        if _lowTemp == nil {
            _lowTemp = 0
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary <String, AnyObject>) {
        
    }
    
    func getForecastWeather(completed: @escaping DownloadComplete) {
        let forecastURL = URL(string: FORECAST_API_CALL)!
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            if let JSON = result.value as? Dictionary <String, AnyObject> {
                if let daily = JSON["daily"] as? Dictionary <String, AnyObject> {
                if let data = daily["data"] as? [Dictionary <String, AnyObject>] {
                    for day in data {
                        let forecast = ForecastWeather(weatherDict: day)
                        self.forecastData.append(forecast)
                        }
                    }
                }
            }
        }
    
    }
    
    
    



}
