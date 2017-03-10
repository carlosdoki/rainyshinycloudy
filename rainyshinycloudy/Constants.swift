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

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL="\(BASE_URL)\(LATITUDE)-23.5106\(LONGITUDE)-46.8762\(APP_ID)\(API_KEY)"
