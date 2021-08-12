//
//  HeaderViewController.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit





class HeatherView:UIViewController {
   
  
   
   let cityH: String
   
   let cityName: UILabel = {
       let city = UILabel()
       city.font = UIFont.systemFont(ofSize: 40, weight: .medium)
       city.textColor = .black
       
       return city
       
       
   }()
   let airStatus: UILabel = {
       let status = UILabel()
       status.font = UIFont.systemFont(ofSize: 18, weight: .light)
       status.text = "Air quality good"
       status.textColor = .gray
       
       return status
       
       
   }()
   let airHideValue: UILabel = {
       let air = UILabel()
      
      air.font = UIFont.systemFont(ofSize: 45, weight: .medium)
      air.text = "15"
       air.textColor = #colorLiteral(red: 0.1310402453, green: 0.3937974572, blue: 0.9513605237, alpha: 1)
       air.textAlignment = .right
       
       return air
       
   }()
   let hideIndex: UILabel = {
       let index = UILabel()
       index.font = UIFont.systemFont(ofSize: 12, weight: .light)
       index.text = "Aqi index"
       index.textColor = .gray
       
       return index
       
       
   }()
   
   var animator : UIViewPropertyAnimator!
   lazy var darkShadow : CAShapeLayer = {
      let ds = CAShapeLayer()
       ds.shadowOffset = CGSize(width: 10, height: 15)


       return ds
   }()
   lazy var lightShadow: CALayer = {

       let light = CALayer()
       light.shadowOffset = CGSize(width: -10, height: -15)
       return light

   }()
  lazy var colorCercle: CALayer = {
       let color = CALayer()
      
       
       return color
       
   }()

   let cercle = CAShapeLayer()
   let cercleView: UIView = {
      let cercle  = UIView()
   
       return cercle
   }()
   
   let airQualityData:UILabel = {
      let air = UILabel()
       air.text = "15"
       air.font = UIFont.systemFont(ofSize: 80, weight: .medium)
       air.textColor = #colorLiteral(red: 0.1310402453, green: 0.3937974572, blue: 0.9513605237, alpha: 1)
       air.layer.shadowColor = UIColor.blue.cgColor
       air.layer.shadowOffset = CGSize(width: 10, height: 10)

       return air

   }()
   let sliderTitle : UILabel = {
      let title = UILabel()
       title.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
       title.text = "µg/m3 norms"
       
       return title
   }()
   
   let airSlider = CustomSlider()
   let sliderStats = SliderStatsView()
   let sliderValues = SliderValues()
   

   init(city: String) {

       self.cityH = city
       super.init(nibName: nil, bundle: nil)
   }

   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   
   
   override func viewDidLoad() {
       super.viewDidLoad()
      
       cityName.text = cityH
       setupHideLabel()
       animate()
       setSlider(slider: airSlider)
    
       view.addSubview(cityName)
       cityName.translatesAutoresizingMaskIntoConstraints = false
       cityName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40).isActive = true
       cityName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 30).isActive = true
        
       view.addSubview(airStatus)
       airStatus.translatesAutoresizingMaskIntoConstraints = false
       airStatus.topAnchor.constraint(equalTo: cityName.bottomAnchor).isActive = true
       airStatus.leadingAnchor.constraint(equalTo: cityName.leadingAnchor).isActive = true
       
       view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
     
       
       
//
       view.addSubview(sliderStats)
      sliderStats.translatesAutoresizingMaskIntoConstraints = false
      sliderStats.bottomAnchor.constraint(equalTo: airSlider.topAnchor,constant: 30).isActive = true
      sliderStats.leadingAnchor.constraint(equalTo: airSlider.leadingAnchor).isActive = true
      sliderStats.trailingAnchor.constraint(equalTo: airSlider.trailingAnchor).isActive = true
      sliderStats.heightAnchor.constraint(equalToConstant: 50).isActive  = true
     
       view.addSubview(sliderValues)
       
       
       sliderValues.translatesAutoresizingMaskIntoConstraints = false
       sliderValues.topAnchor.constraint(equalTo: airSlider.bottomAnchor,constant: -30).isActive = true
       sliderValues.leadingAnchor.constraint(equalTo: airSlider.leadingAnchor).isActive = true
       sliderValues.trailingAnchor.constraint(equalTo: airSlider.trailingAnchor).isActive = true
       sliderValues.heightAnchor.constraint(equalToConstant: 50).isActive  = true
       
       
       view.addSubview(sliderTitle)
       sliderTitle.translatesAutoresizingMaskIntoConstraints = false
       sliderTitle.bottomAnchor.constraint(equalTo: sliderStats.topAnchor,constant: 15).isActive = true
       sliderTitle.leadingAnchor.constraint(equalTo: sliderStats.leadingAnchor).isActive = true
       sliderTitle.trailingAnchor.constraint(equalTo: sliderStats.trailingAnchor).isActive = true
       sliderTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
   }
   
   override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(true)

       animate()
       setSlider(slider: airSlider)
       
   }

   override func viewDidLayoutSubviews() {
       setupCercleView()
       updatePath()
   }
   
   func animate() {
       
      let anim = CABasicAnimation(keyPath: "shadowRadius")
       anim.fromValue = 0
       anim.toValue = 30
       anim.duration = 2
       anim.repeatCount = .infinity
       anim.autoreverses = true
       colorCercle.add(anim, forKey: "shadowRadius")
//
   }
   
   // MARK: Create path and add shadow and light to cercle
   
   private func updatePath() {
       
       cercle.fillColor = UIColor.clear.cgColor
       cercleView.layer.addSublayer(cercle)
   
       let arcCenter = CGPoint(x: cercleView.bounds.midX, y: cercleView.bounds.midY )
       let radius = (min(cercleView.bounds.width, cercleView.bounds.height)) / 2.5
       cercle.path = UIBezierPath(arcCenter: arcCenter, radius:radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath
       cercle.transform = CATransform3DIdentity
       cercle.frame = cercleView.bounds
       
       darkShadow.frame = self.view.bounds
       darkShadow.transform  = CATransform3DIdentity
       darkShadow.frame = self.view.bounds
       darkShadow.fillColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
       darkShadow.shadowColor = UIColor.darkGray.withAlphaComponent(0.3).cgColor
       darkShadow.shadowOpacity = 0.5
       darkShadow.shadowRadius = 20
       darkShadow.path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath
       
       
       cercle.insertSublayer(darkShadow, at: 0)
//        cercle.insertSublayer(lightShadow, at: 0)
       cercle.insertSublayer(colorCercle, at: 0)

  
       lightShadow.frame = self.view.bounds
       lightShadow.transform = CATransform3DIdentity
      lightShadow.shadowRadius = 12
       lightShadow.shadowOpacity = 1
       lightShadow.shadowPath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath
      lightShadow.shadowColor = UIColor.white.withAlphaComponent(1).cgColor
       
       colorCercle.frame = self.view.bounds
       colorCercle.transform = CATransform3DIdentity
       colorCercle.shadowOpacity = 0.8
       colorCercle.shadowPath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath
       colorCercle.shadowColor = UIColor.systemBlue.cgColor
       
       
       
       cercleView.addSubview(airQualityData)
       
       airQualityData.translatesAutoresizingMaskIntoConstraints = false
       airQualityData.centerYAnchor.constraint(equalTo: cercleView.centerYAnchor).isActive = true
       airQualityData.centerXAnchor.constraint(equalTo: cercleView.centerXAnchor).isActive = true
   }
   
   // MARK: Setup cercle constraints
   
   func setupCercleView() {
       
       view.addSubview(cercleView)
       cercleView.translatesAutoresizingMaskIntoConstraints = false

       cercleView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 30).isActive = true
       cercleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       cercleView.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.6).isActive = true
       cercleView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.6).isActive = true
       
   }
   
   
   // MARK: Setup slider for all AQI AIR Data
  
   func setSlider(slider:UISlider) {
       
       view.addSubview(airSlider)
           airSlider.translatesAutoresizingMaskIntoConstraints = false
       
       airSlider.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20).isActive = true
       airSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30).isActive = true
       airSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25).isActive = true
       airSlider.heightAnchor.constraint(equalToConstant: 50).isActive = true
           
           airSlider.minimumValue = 0
           airSlider.maximumValue = 500
           airSlider.isContinuous = false

           airSlider.thumbTintColor = .clear
            

           
           airSlider.addTarget(self, action: #selector(valueChange), for: .valueChanged)
           airSlider.setValue(500, animated: true)
           airSlider.isUserInteractionEnabled = false

           let tgl = CAGradientLayer()
           let frame = CGRect(x: 0, y: 0, width: slider.frame.size.width / 5 , height: 500)
           tgl.frame = frame
       tgl.colors = [CustomColors.mUltraLightBlue.cgColor, CustomColors.mLightBlue.cgColor, CustomColors.mOrange.cgColor, CustomColors.mRed.cgColor, CustomColors.mPurple.cgColor]
           tgl.startPoint = CGPoint(x: 0.0, y: 0.5)
           tgl.endPoint = CGPoint(x: 1.0, y: 0.5)

           UIGraphicsBeginImageContextWithOptions(tgl.frame.size, tgl.isOpaque, 0.0);
           tgl.render(in: UIGraphicsGetCurrentContext()!)
           let image = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()

           image?.resizableImage(withCapInsets: UIEdgeInsets.zero)

           slider.setMinimumTrackImage(image, for: .normal)
      

       }
        
       
       @objc func valueChange() {
           
          
       }

   func setupHideLabel() {
       
       let hideLabelStack = UIStackView(arrangedSubviews: [airHideValue,hideIndex])
       hideLabelStack.axis = .vertical
       hideLabelStack.distribution = .fillEqually
       hideLabelStack.setCustomSpacing(-20, after: airHideValue)
       
       view.addSubview(hideLabelStack)
   
       hideLabelStack.translatesAutoresizingMaskIntoConstraints = false
       hideLabelStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40).isActive = true
       hideLabelStack.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -45).isActive = true
//        hideLabelStack.widthAnchor.constraint(equalToConstant: 30).isActive = true
//        hideLabelStack.heightAnchor.constraint(equalToConstant: 30).isActive = true
       
   }
   
}
