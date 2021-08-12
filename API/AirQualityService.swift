//
//  AirQualityService.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit

protocol AirQualityManagerDelegate {
    
    func didUpdateAir(_ airManager: AirQualityService , _ air: AirModel)
    func didFailsWithError(error: Error)
}

struct AirQualityService {
    
    
    var delegate: AirQualityManagerDelegate?
    let airUrl = "https://api.weatherbit.io/v2.0/current/airquality?city="
    
    func fetchWeather(cityName: String) {
        let urlString = "\(airUrl)\(cityName)&key=1eedea79d3014d4695b510d30c923e3a"
        self.performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, resp, err in
                
                if err != nil {
                    self.delegate?.didFailsWithError(error: err!)
                    return
                }
                
                if let safeData = data {
                    if let airSafe =  self.parseJSON(weathherData: safeData) {
                        self.delegate?.didUpdateAir(self, airSafe)
                        
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weathherData: Data) -> AirModel? {
      let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(AirManager.self, from: weathherData)
    
            let aqi = decodeData.data[0].aqi
            let pm25 = decodeData.data[0].pm25
            let pm10 = decodeData.data[0].pm10
            let co2 = decodeData.data[0].co
            let so2 = decodeData.data[0].so2
            let no2 = decodeData.data[0].no2
            let o3 = decodeData.data[0].o3
            
            let airModel = AirModel(aqi: aqi, pm10: pm10, co: co2, so2: so2, no2: no2, pm25: pm25, o3: o3)
            return airModel
        }catch {
            
            delegate?.didFailsWithError(error: error)
            return nil
        }
}
}
