//
//  WeatherCell.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit

class GraphCell: UICollectionViewCell {
    
    
    // MARK: Setup title Values, City name, Weather Value, Weather Icon
    
    let weatherValue: UILabel = {
        let weather = UILabel()
        weather.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        weather.text = "25°"
        weather.textColor = .white
        
        return weather
        
    }()
    let cityName: UILabel = {
        let city = UILabel()
        city.font = UIFont.systemFont(ofSize: 15, weight: .light)
        city.text = "Bucharest"
        city.textColor = .white
        
        return city
        
    }()
    let weatherIcon: UIImageView = {
        let weather = UIImageView(image: UIImage(systemName: "cloud.sun"))
        weather.tintColor = .white
        weather.contentMode = .scaleAspectFit
        weather.translatesAutoresizingMaskIntoConstraints = false
        weather.widthAnchor.constraint(equalToConstant: 10).isActive  = true
        weather.heightAnchor.constraint(equalToConstant: 10).isActive  = true
        

        return weather
    }()
    let weatherStat: UILabel = {
        let weatherStat = UILabel()
        weatherStat.text = "Cloudy Day"
        weatherStat.font = UIFont.systemFont(ofSize: 14, weight: .light)
        weatherStat.textAlignment = .right
        weatherStat.textColor = .white
        
        return weatherStat
    }()
    
    
    // MARK: Setup Sun rise Image, Labels,Containers

    let sunRiseText: UILabel = {
        let sunRise = UILabel()
        sunRise.text = "25:21"
        sunRise.textAlignment = .left
        sunRise.textColor = .white
        
        return sunRise
        
    }()
    let suntRiseImage = UIImageView(image: UIImage(systemName: "sunrise"))
    let sunRiseContainer = UIView()
    
    let sunsetText: UILabel = {
        let sunset = UILabel()
        sunset.text = "25:21"
        sunset.textAlignment = .right
        sunset.textColor = .white
        sunset.backgroundColor = .clear
        
        return sunset
        
    }()
    let sunsetImage = UIImageView(image: UIImage(systemName: "sunset"))
    let sunsetContainer = UIView()
    
    let lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .white
        line.alpha = 0.2
       
        
        return line
    }()
    
    // MARK: Weather objects from Weather Data View.
    
    let humidity = WeatherDataView(titleWeather: "Humidity", image: UIImage(named: "humidity")!, value: "25 %")
    let pressure = WeatherDataView(titleWeather: "Pressure", image: UIImage(named:  "pressure")!, value: "1014 hPa")
    let visibility = WeatherDataView(titleWeather: "Visibility", image: UIImage(named: "eye")!, value: "16.1 km")
    let windSpeed = WeatherDataView(titleWeather: "Wind speed", image: UIImage(named: "wind")!, value: "13 km/hr")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        setupViewsConstraints()
        setupWWeatherObjectsStack()
        suntRiseImage.tintColor = .white
        sunsetImage.tintColor = .white
        backgroundColor = #colorLiteral(red: 0.4210726619, green: 0.3380932808, blue: 0.9925324321, alpha: 1)
    }
    
    func setupWWeatherObjectsStack() {
        
        // MARK: Weather Data Objects stack
        
            let weatherDataObjectsStack = UIStackView(arrangedSubviews: [humidity.view,pressure.view,visibility.view,windSpeed.view])
            weatherDataObjectsStack.axis = .vertical
            weatherDataObjectsStack.distribution = .fillEqually
        weatherDataObjectsStack.backgroundColor = .clear
            
           
            addSubview(weatherDataObjectsStack)
            
            weatherDataObjectsStack.translatesAutoresizingMaskIntoConstraints = false
            weatherDataObjectsStack.topAnchor.constraint(equalTo: weatherValue.bottomAnchor,constant: 30).isActive = true
            weatherDataObjectsStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
            weatherDataObjectsStack.leadingAnchor.constraint(equalTo: weatherValue.leadingAnchor).isActive = true
            weatherDataObjectsStack.trailingAnchor.constraint(equalTo: weatherStat.trailingAnchor).isActive = true
            
        // MARK: Sunrise Stack
        
            let sunRiseStack = UIStackView(arrangedSubviews: [sunRiseText,sunRiseContainer])
            sunRiseStack.axis = .horizontal
            sunRiseStack.distribution = .fillEqually
            sunRiseStack.backgroundColor = .clear
        
        
        // MARK: Image container: Adding image with autolayout inside containers
        
        sunsetContainer.addSubview(sunsetImage)
        
        sunsetImage.translatesAutoresizingMaskIntoConstraints = false
        sunsetImage.centerYAnchor.constraint(equalTo: sunsetContainer.centerYAnchor).isActive = true
        sunsetImage.trailingAnchor.constraint(equalTo: sunsetContainer.trailingAnchor).isActive = true
        sunsetImage.widthAnchor.constraint(equalTo: sunsetContainer.widthAnchor, multiplier: 0.3).isActive = true
        sunsetImage.heightAnchor.constraint(equalTo: sunsetContainer.heightAnchor, multiplier: 0.3).isActive = true
        
        sunRiseContainer.addSubview(suntRiseImage)
        
        suntRiseImage.translatesAutoresizingMaskIntoConstraints = false
        suntRiseImage.centerYAnchor.constraint(equalTo: sunRiseContainer.centerYAnchor).isActive = true
        suntRiseImage.leadingAnchor.constraint(equalTo: sunRiseContainer.leadingAnchor).isActive = true
        suntRiseImage.widthAnchor.constraint(equalTo: sunRiseContainer.widthAnchor, multiplier: 0.3).isActive = true
        suntRiseImage.heightAnchor.constraint(equalTo: sunRiseContainer.heightAnchor, multiplier: 0.3).isActive = true

           
        // MARK: Sunset Stack and big stack
        
            let sunsetStack = UIStackView(arrangedSubviews: [sunsetContainer ,sunsetText])
            sunsetStack.axis = .horizontal
            sunsetStack.distribution = .fillEqually
        
            let riseSunetStack = UIStackView(arrangedSubviews: [sunRiseStack,sunsetStack])
            riseSunetStack.axis = .horizontal
            riseSunetStack.distribution = .fillEqually
        riseSunetStack.backgroundColor = .clear
            
            addSubview(riseSunetStack)
            
            riseSunetStack.translatesAutoresizingMaskIntoConstraints = false
            riseSunetStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            riseSunetStack.leadingAnchor.constraint(equalTo: weatherValue.leadingAnchor).isActive = true
            riseSunetStack.trailingAnchor.constraint(equalTo: weatherStat.trailingAnchor).isActive = true
            riseSunetStack.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.2).isActive = true
            
           addSubview(lineView)
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.bottomAnchor.constraint(equalTo: riseSunetStack.topAnchor).isActive = true
        lineView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        
        
       
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 5.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true
        
        // cell shadow section
        self.contentView.layer.cornerRadius = 15.0
        self.contentView.layer.borderWidth = 5.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.1
        self.layer.cornerRadius = 15.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    // MARK: Setup weather stack sunrise, sunet Stack and add constraints
    
    func setupViewsConstraints() {
        
        let weatherNameLocationStack = UIStackView(arrangedSubviews: [cityName,weatherValue])
        weatherNameLocationStack.axis = .vertical
        weatherNameLocationStack.distribution = .fillEqually
        weatherNameLocationStack.setCustomSpacing(-10, after: cityName)
        
        addSubview(weatherNameLocationStack)
        weatherNameLocationStack.translatesAutoresizingMaskIntoConstraints = false
        weatherNameLocationStack.topAnchor.constraint(equalTo: topAnchor,constant: 20).isActive = true
        weatherNameLocationStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 35).isActive = true
        weatherNameLocationStack.widthAnchor.constraint(equalTo:  widthAnchor, multiplier: 0.4).isActive = true
        weatherNameLocationStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
        
       addSubview(weatherIcon)
      weatherIcon.translatesAutoresizingMaskIntoConstraints = false
      weatherIcon.topAnchor.constraint(equalTo: topAnchor,constant: 30).isActive = true
      weatherIcon.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10).isActive = true
      weatherIcon.widthAnchor.constraint(equalTo:  widthAnchor, multiplier: 0.2).isActive = true
      weatherIcon.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.08).isActive = true
        
        addSubview(weatherStat)
        
        weatherStat.translatesAutoresizingMaskIntoConstraints = false
        weatherStat.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor).isActive = true
        weatherStat.trailingAnchor.constraint(equalTo: weatherIcon.trailingAnchor,constant: -15).isActive = true
        weatherStat.widthAnchor.constraint(equalTo:  widthAnchor, multiplier: 0.4).isActive = true
        weatherStat.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.08).isActive = true
    }
    }
