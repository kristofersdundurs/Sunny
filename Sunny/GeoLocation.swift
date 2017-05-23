//
//  GeoLocation.swift
//  Sunny
//
//  Created by Kristofers Dundurs on 19/05/2017.
//  Copyright © 2017 Kristofers Dundurs. All rights reserved.
//

import Foundation
import Alamofire

class GeoLocation {
    
    var _currentCity: String!
    var _currentCountry: String!
    
    var currentCity: String {
        if _currentCity == nil {
            _currentCity = ""
        }
        return _currentCity
    }
    
    var currentCountry: String {
        if _currentCountry == nil {
            _currentCountry = ""
        }
        return _currentCountry
    }
    
    
    func getLocation(completed: @escaping DownloadComplete) {
        let geoCodeURL = URL(string: FULL_GEOCODE_URL)!
        Alamofire.request(geoCodeURL).responseJSON { response in
            let result = response.result
            if let JSON = result.value as? Dictionary <String, AnyObject> {
                if let results = JSON["results"] as? [Dictionary<String, AnyObject>] {
                    if let main = results[0]["address_components"] as? [Dictionary<String, AnyObject>] {
                        if let town = main[2]["short_name"] as? String {
                            self._currentCity = town.capitalized
                        }
                        if let country = main[3]["long_name"] as? String {
                            self._currentCountry = country.capitalized
                        }
                    }
                }
            }
            completed()
        }
    }

    
 
    
}
