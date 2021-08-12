//
//  WeatherDataViewController.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit

class WeatherDataView: UIViewController {
    
    
    let titleWeather: String
    let image: UIImage
    let value: String
    
    
    let weatherTitle: UILabel = {
       let humidity = UILabel()
        humidity.textColor = .white
        
        return humidity
    
    }()
    let weatherIcon: UIImageView = {
        let hI = UIImageView(image: UIImage(named: "name"))
        hI.frame = CGRect(x: 0, y: 0, width: 1000, height: 1)
        hI.contentMode = .scaleAspectFit
        hI.tintColor = .white
        
        return hI
    }()
    
    let weatherValue: UILabel = {
        let humidty = UILabel()
        humidty.textAlignment = .right
        humidty.textColor = .white
        
        return humidty

    }()
    
    let iconConatainer = UIView()
    
    init(titleWeather: String, image: UIImage,value: String) {
        self.titleWeather = titleWeather
        self.image = image
        self.value = value
       
        super.init(nibName: nil, bundle: nil)
        weatherTitle.text = titleWeather
        weatherIcon.image = image
        weatherValue.text = value
        
        weatherIcon.tintColor = .white
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        let weatherStack = UIStackView(arrangedSubviews: [weatherTitle,iconConatainer,weatherValue])
        weatherStack.axis = .horizontal
        weatherStack.distribution = .fillEqually
        view.backgroundColor = .clear
       

        view.addSubview(weatherStack)
        
        weatherStack.translatesAutoresizingMaskIntoConstraints = false
        weatherStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        weatherStack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        weatherStack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        weatherStack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        iconConatainer.addSubview(weatherIcon)
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        weatherIcon.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        weatherIcon.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        weatherIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        weatherIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}

