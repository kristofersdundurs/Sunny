//
//  Constants.swift
//  Sunny
//
//  Created by Kristofers Dundurs on 10/04/2017.
//  Copyright © 2017 Kristofers Dundurs. All rights reserved.
//

import Foundation
import UIKit

class GlobalVariables {
    var _currentLatitude: Double!
    var _currentLongitude: Double!
    
    var currentLatitude: Double {
        if _currentLatitude == nil {
            _currentLatitude = 0
        }
        return _currentLatitude
    }
    
    var currentLongitude: Double {
        if _currentLongitude == nil {
            _currentLongitude = 0
        }
        return _currentLongitude
    }
}

var global = GlobalVariables()

let BASE_GEOCODE_URL = "https://maps.googleapis.com/maps/api/geocode/json?latlng="
let CURRENT_WEATHER_BASE_URL = "https://api.darksky.net/forecast/"
let FORECAST_WEATHER_BASE_URL = ""
let LAT_VALUE = "\(global.currentLatitude),"
let LON_VALUE = "\(global.currentLongitude)"
let FORECAST_API_KEY = "29b724b490ce1d2a9a55ad88117d0e0f/"
let GEOCODE_API_KEY = "&key=AIzaSyCyNT773-VGFt55cyXkzVEk5XBZ2g0C4ko"

let FULL_GEOCODE_URL = "\(BASE_GEOCODE_URL + LAT_VALUE + LON_VALUE + GEOCODE_API_KEY)"
let CURRENT_API_CALL = "\(CURRENT_WEATHER_BASE_URL + FORECAST_API_KEY + LAT_VALUE + LON_VALUE)?units=si"
let FORECAST_API_CALL = ""

typealias DownloadComplete = ()->()
