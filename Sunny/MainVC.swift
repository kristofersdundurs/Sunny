//  ViewController.swift
//  Sunny
//
//  Created by Kristofers Dundurs on 09/04/2017.
//  Copyright © 2017 Kristofers Dundurs. All rights reserved.
//

import UIKit
import CoreLocation

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    @IBOutlet weak var currentTemperature: UILabel!
    @IBOutlet weak var currentLocation: UILabel!
    @IBOutlet weak var currentWeatherType: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var utilityIcon: UIImageView!
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var forecastWeather: ForecastWeather!
    var geoLocation: GeoLocation!
    
    var locationManager: CLLocationManager!
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocationCoordinate2D = manager.location!.coordinate
        print(userLocation.latitude + userLocation.longitude)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentWeather = CurrentWeather()
        geoLocation = GeoLocation()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.requestAlwaysAuthorization()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            print("Location retrieved successfully")
            global._currentLatitude = locationManager.location?.coordinate.latitude
            global._currentLongitude = locationManager.location?.coordinate.longitude
            geoLocation = GeoLocation()
            currentWeather = CurrentWeather()
            locationManager.stopUpdatingLocation()
        } else {
            print("Location services are not enabled")
        }
        geoLocation.getLocation {
            print("Getlocation called succerssfullyy")
        }
        currentWeather.getCurrentWeather {
            self.updateMainUI()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        print(FULL_GEOCODE_URL)
    }
    
    //TableView boilerplate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    //Updating UI labels
    func updateMainUI() {
        currentDate.text = "Today, \(currentWeather.date)"
        currentTemperature.text = "\(Int(currentWeather.temperature))°"
        currentWeatherType.text = "\(currentWeather.weatherType), \(currentWeather.wind) m/s"
        currentLocation.text = "\(geoLocation.currentCity), \(geoLocation.currentCountry)"
    }
    
}

