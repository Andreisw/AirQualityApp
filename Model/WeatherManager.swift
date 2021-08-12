//
//  WeatherManager.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation

struct WeatherManager: Decodable {
    
    var name: String
    var main : Main
    var wind: Wind
    var visibility: Int
    var pressure: Int
    
}

struct Weather: Decodable {
    var main: String
    var description: String
}

struct Main:Decodable {
    var temp: Double
    var pressure: Int
    var humidity: Int
    
}

struct Wind: Decodable {
    var speed: Float

}

