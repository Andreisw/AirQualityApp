//
//  CitiesApi.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit


class CitiesApi: NSObject {
    static let shared = CitiesApi()
    
    
    func fetchPosts(completion: @escaping (Result<CitiesManager, Error>) -> ()) {
        guard let url = URL(string: "https://countriesnow.space/api/v0.1/countries/population/cities") else {return}
        
        print(url)
        URLSession.shared.dataTask(with: url) { (data,resp,err) in
            
            DispatchQueue.main.async {
            if let err = err {
                print("Failed to fetch posts", err)
                return
            }
                guard let data = data else {return}

            do {
                let posts = try  JSONDecoder().decode(CitiesManager.self, from: data)
                
                print(posts.data[0].city)
                completion(.success(posts))
            }catch {
                completion(.failure(error))
            }
            
            }
            
        }.resume()
    }
}
