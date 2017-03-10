//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Carlos Doki on 09/03/17.
//  Copyright © 2017 Carlos Doki. All rights reserved.
//

import Foundation

let BASE_URL="http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE="lat="
let LONGITUDE="&lon="
let APP_ID="&appid="
let API_KEY="c4870bd8a585bff76835a90ff5739b36"

//api.openweathermap.org/data/2.5/forecast/daily?lat={lat}&lon={lon}&cnt={cnt}

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL="\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"
let FORECAST_URL="http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10\(APP_ID)\(API_KEY)"
