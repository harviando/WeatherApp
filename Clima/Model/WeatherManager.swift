//
//  WeatherManager.swift
//  Clima
//
//  Created by Muhammad Harviando on 17/09/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "iniURL_"
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        
    }
}
