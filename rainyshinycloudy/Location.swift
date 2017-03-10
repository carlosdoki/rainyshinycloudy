//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Carlos Doki on 3/10/17.
//  Copyright © 2017 Carlos Doki. All rights reserved.
//

import CoreLocation


class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
