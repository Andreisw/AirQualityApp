//
//  AirService.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit

class AirService: NSObject {
  
    
    
  static  func fetchPosts(completion: @escaping (Result<AirManager, Error>) -> ()) {
        guard let url = URL(string: "https://api.weatherbit.io/v2.0/current/airquality?city=Bucharest&key=1eedea79d3014d4695b510d30c923e3a") else {return}
        
        print(url)
        URLSession.shared.dataTask(with: url) { (data,resp,err) in
            
            DispatchQueue.main.async {
            if let err = err {
                print("Failed to fetch posts", err)
                return
            }
            guard let data = data else {return}

            do {
                let posts = try  JSONDecoder().decode(AirManager.self, from: data)
                completion(.success(posts))
            }catch {
                completion(.failure(error))
            }
            
            }
            
        }.resume()
    }
}
