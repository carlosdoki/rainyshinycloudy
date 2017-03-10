//
//  WeatherVC.swift
//  rainyshinycloudy
//
//  Created by Carlos Doki on 09/03/17.
//  Copyright © 2017 Carlos Doki. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var localtionLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeaterTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    let locationManger = CLLocationManager()
//    var currentLocation: CLLocation!
    
    var currentWeather : CurrentWeather!
    var forecast : Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        locationManger.startMonitoringSignificantLocationChanges()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
//            currentLocation = locationManger.location
//            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
//            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            Location.sharedInstance.latitude = locationManger.location?.coordinate.latitude
            Location.sharedInstance.longitude = locationManger.location?.coordinate.longitude
            currentWeather.downloadingWeatherDetails {
                self.downloadForecastData {
                    self.updateMainUI()
                }
            }

        } else {
            locationManger.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        let forecastURL = URL(string: FORECAST_URL)
        Alamofire.request(forecastURL!).responseJSON {
            response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        } else {
            return WeatherCell()
        }
    }

    func updateMainUI() {
        
        dateLabel.text = currentWeather.date
        currentLabel.text = "\(currentWeather.currentTemp)°"
        currentWeaterTypeLabel.text = currentWeather.weatherType
        localtionLabel.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
}

