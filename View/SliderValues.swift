//
//  File.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit

class SliderValues : UIView {
    
    
    let veryGood: UILabel = {
      let vg = UILabel()
        vg.font = UIFont.systemFont(ofSize: 9, weight: .light)
        vg.text = "very good"
        vg.textAlignment = .left
        
        return vg
        
    }()
    let good: UILabel = {
      let vg = UILabel()
        vg.font = UIFont.systemFont(ofSize: 9, weight: .light)
        vg.text = "good"
        
        return vg
        
    }()
    let moderate: UILabel = {
      let vg = UILabel()
        vg.font = UIFont.systemFont(ofSize: 9, weight: .light)
        vg.text = "moderate"
        
        return vg
        
    }()
    let passable: UILabel = {
      let vg = UILabel()
        vg.font = UIFont.systemFont(ofSize: 9, weight: .light)
        vg.text = "passable"
        
        return vg
        
    }()
    let bad: UILabel = {
      let vg = UILabel()
        vg.font = UIFont.systemFont(ofSize: 9, weight: .light)
        vg.text = "bad"
        
        return vg
        
    }()
    
    let verybad: UILabel = {
      let vg = UILabel()
        vg.font = UIFont.systemFont(ofSize: 9, weight: .light)
        vg.text = "very bad"
        vg.textAlignment = .right
        
        return vg
        
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let sliderDataStack = UIStackView(arrangedSubviews: [veryGood,good,moderate,passable,bad,verybad])
        sliderDataStack.axis = .horizontal
        sliderDataStack.distribution = .fillEqually
        
        addSubview(sliderDataStack)
        sliderDataStack.translatesAutoresizingMaskIntoConstraints = false
        sliderDataStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        sliderDataStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        sliderDataStack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        sliderDataStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

