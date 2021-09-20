//
//  WeatherData.swift
//  Clima
//
//  Created by Muhammad Harviando on 17/09/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather] //this property is on array
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable { //this structure is an structture to each array that exist on "weather" properties
    let description: String
    let id: Int
}
