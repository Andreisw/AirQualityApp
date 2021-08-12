//
//  CitiesCell.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit

class CitiesCell : UICollectionViewCell {
    
    let cityName: UILabel = {
    let city = UILabel()
    city.font = UIFont.systemFont(ofSize: 25, weight: .medium)
    city.text = "Bucharest"
        city.textColor = .black
    
    return city
    
}()
    let windSpeed: UILabel = {
       let wind = UILabel()
        wind.font = UIFont.systemFont(ofSize: 12, weight: .light)
        wind.text = "wind speed: 25km/h"
        wind.textColor = .black
        
        return wind
        
    }()
    let aqiAirTitle: UILabel = {
       let aqiTitle = UILabel()
        aqiTitle.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        aqiTitle.text = "AQI air index"
        aqiTitle.textColor = .black
        
        return aqiTitle
        
    }()
    let aqiStatus: UILabel = {
       let status = UILabel()
        status.font = UIFont.systemFont(ofSize: 12, weight: .light)
        status.text = "Air quality: Good"
        status.textColor = .black
        status.textAlignment = .center
        return status
        
    }()
    
    
    let cercle = CAShapeLayer()
    
    let viewOfCercle: UIView = {
       let cercle  = UIView()
    
        return cercle
    }()
    
    lazy var colorCercle: CALayer = {
         let color = CALayer()
        
         return color
         
     }()
    
    lazy var darkShadow : CAShapeLayer = {
       let ds = CAShapeLayer()
        ds.shadowOffset = CGSize(width: 0, height: 0)
        return ds
    }()

    lazy var lightShadow: CALayer = {
        let light = CALayer()
        light.shadowOffset = CGSize(width: -10, height: -15)
        return light
 
    }()


    let airQualityData:UILabel = {
       let air = UILabel()
        air.text = "15"
        air.font = UIFont.systemFont(ofSize: 45, weight: .medium)
        air.textColor = CustomColors.mLightBlue
        air.layer.shadowColor = UIColor.blue.cgColor
        air.layer.shadowOffset = CGSize(width: 10, height: 10)

        return air

    }()
    
    let slider1 = SliderView(color: CustomColors.mLightBlue, component: "Pm25", sliderValue: 0.0)
    let slider2 = SliderView(color: CustomColors.mLightBlue, component: "Pm10", sliderValue: 1)
    let slider3 = SliderView(color: CustomColors.mLightBlue,  component: "So2  ", sliderValue: 0.2)
    let slider4 = SliderView(color: CustomColors.mLightBlue,  component: "Co2  ", sliderValue: 0.7)
    let slider5 = SliderView(color: CustomColors.mLightBlue,  component: "No2  ", sliderValue: 0.4)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor =  .white
        layer.cornerRadius = 30
        layer.masksToBounds = true
        setupTitleViews()
        setupCercleView()
        updatePath()
        
        
        let sliderStack = UIStackView(arrangedSubviews: [slider1.view,slider2.view,slider3.view,slider4.view,slider5.view])
        sliderStack.axis = .vertical
        sliderStack.distribution = .fillEqually
        
       addSubview(sliderStack)
       
        
     sliderStack.translatesAutoresizingMaskIntoConstraints = false
     sliderStack.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10).isActive = true
     sliderStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10).isActive = true
     sliderStack.heightAnchor.constraint(equalTo:self.heightAnchor,multiplier: 0.6).isActive = true
     sliderStack.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 0.55).isActive = true
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
            // cell rounded section
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
    
    func setupTitleViews() {
        
        let cityAndWindStack = UIStackView(arrangedSubviews: [cityName,windSpeed])
        cityAndWindStack.axis = .vertical
        cityAndWindStack.distribution = .fillEqually
        
        addSubview(cityAndWindStack)
        cityAndWindStack.translatesAutoresizingMaskIntoConstraints = false
        cityAndWindStack.topAnchor.constraint(equalTo: topAnchor,constant: 20).isActive = true
        cityAndWindStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20).isActive = true
        cityAndWindStack.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.2).isActive = true
        
        let aqiTitleAndStatus = UIStackView(arrangedSubviews: [aqiAirTitle,aqiStatus])
        aqiTitleAndStatus.axis = .vertical
        aqiTitleAndStatus.distribution = .fillEqually
        aqiTitleAndStatus.setCustomSpacing(-10, after: aqiAirTitle)
        
        addSubview(aqiTitleAndStatus)
        aqiTitleAndStatus.translatesAutoresizingMaskIntoConstraints = false
       aqiTitleAndStatus.topAnchor.constraint(equalTo: topAnchor,constant: 20).isActive = true
       aqiTitleAndStatus.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30).isActive = true
       aqiTitleAndStatus.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.2).isActive = true
    }
    
    private func updatePath() {
        
        
        cercle.fillColor = UIColor.white.cgColor
        viewOfCercle.layer.addSublayer(cercle)
        
        let arcCenter = CGPoint(x: viewOfCercle.bounds.midX + 80, y: viewOfCercle.bounds.midY + 85 )
        let radius = (min(viewOfCercle.bounds.width, viewOfCercle.bounds.height)) / 2.2
        cercle.path = UIBezierPath(arcCenter: arcCenter, radius: 58, startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath
        cercle.transform = CATransform3DIdentity
        cercle.frame = viewOfCercle.bounds
        
        cercle.cornerRadius = 15.0
        cercle.masksToBounds = true
        cercle.shadowColor = UIColor.black.cgColor
        cercle.shadowOffset = CGSize(width: 0, height: 0.0)
        cercle.shadowRadius = 5.0
        cercle.shadowOpacity = 0.1
        cercle.masksToBounds = false
        cercle.shadowPath = UIBezierPath(arcCenter: arcCenter, radius: 60, startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath

        
//        cercle.insertSublayer(darkShadow, at: 0)
        
        colorCercle.frame = self.bounds
        colorCercle.transform = CATransform3DIdentity
        colorCercle.shadowOpacity = 0.8
        colorCercle.shadowPath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath
        colorCercle.shadowColor = UIColor.cyan.cgColor
        
        
        
        viewOfCercle.addSubview(airQualityData)
        
        airQualityData.translatesAutoresizingMaskIntoConstraints = false
        airQualityData.centerYAnchor.constraint(equalTo: viewOfCercle.centerYAnchor,constant: 5).isActive = true
        airQualityData.centerXAnchor.constraint(equalTo: viewOfCercle.centerXAnchor).isActive = true
    }
    func setupCercleView() {
        
        
        addSubview(viewOfCercle)
        viewOfCercle.translatesAutoresizingMaskIntoConstraints = false
        
        viewOfCercle.topAnchor.constraint(equalTo: aqiStatus.bottomAnchor).isActive = true
        viewOfCercle.leadingAnchor.constraint(equalTo: aqiStatus.leadingAnchor,constant: -20).isActive = true
        viewOfCercle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        viewOfCercle.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
}
