//
//  WeatherService.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit

class WeatherService: NSObject {
    static let shared = WeatherService()
    
    
    func fetchPosts(completion: @escaping (Result<WeatherManager, Error>) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Bucharest&appid=07c80d7de7c91d829746835bd4a818b6&fbclid=IwAR34jovHFV9l5Aih1sRBrNzU3kXBNMzx8UQkjr6fmoFadzwbpg4355k2dy0") else {return}
        
        print(url)
        URLSession.shared.dataTask(with: url) { (data,resp,err) in
            
            DispatchQueue.main.async {
            if let err = err {
                print("Failed to fetch posts", err)
                return
            }
            guard let data = data else {return}

            do {
                let posts = try  JSONDecoder().decode(WeatherManager.self, from: data)
                completion(.success(posts))
            }catch {
                completion(.failure(error))
            }
            
            }
        }.resume()
        
    }
}
