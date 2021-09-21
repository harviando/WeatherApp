//
//  WeatherModel.swift
//  Clima
//
//  Created by Muhammad Harviando on 20/09/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temprature: Double
    var tempratureString: String {
        return String(format: "%.0f", temprature)
    }
    
    let description: String
    
    var conditionName: String { //Computed property; datatype is type that needs to be returned
        switch conditionId{
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.sun"
        default:
            return "cloud"
        }
    }
}
