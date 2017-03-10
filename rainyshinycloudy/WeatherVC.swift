//
//  WeatherVC.swift
//  rainyshinycloudy
//
//  Created by Carlos Doki on 09/03/17.
//  Copyright © 2017 Carlos Doki. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var localtionLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeaterTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var currentWeather : CurrentWeather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        currentWeather.downloadingWeatherDetails {
//            print("Inicio")
//            print(self.currentWeather.cityName)
            self.updateMainUI()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
    }

    func updateMainUI() {
        
        dateLabel.text = currentWeather.date
        currentLabel.text = "\(currentWeather.currentTemp)°"
        currentWeaterTypeLabel.text = currentWeather.weatherType
        localtionLabel.text = currentWeather.cityName
        //currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
}

