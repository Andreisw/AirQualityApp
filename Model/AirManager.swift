//
//  AirManager.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation

struct AirManager: Decodable {
    var city_name: String
    var data: [Datas]
}


struct Datas: Decodable {
    
    var aqi : Int
    var pm10: Float
    var co: Float
    var o3 : Float
    var so2: Float
    var no2: Float
    var pm25: Float
}
