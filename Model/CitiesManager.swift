//
//  CitiesManager.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation

struct CitiesManager: Decodable {
    var data : [Datass]
}

struct Datass: Decodable {
    var city: String
}

struct CitiesModel {
    var city : String
    
}
