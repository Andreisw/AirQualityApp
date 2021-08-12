//
//  SliderStatsView.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit

class SliderStatsView : UIView {
    
    
    let veryGood: UILabel = {
      let vg = UILabel()
        vg.font = UIFont.systemFont(ofSize: 9, weight: .light)
        vg.text = "0"
        vg.textAlignment = .left
        
        return vg
        
    }()
    let good: UILabel = {
      let vg = UILabel()
        vg.font = UIFont.systemFont(ofSize: 9, weight: .light)
        vg.text = "50"
        
        return vg
        
    }()
    let moderate: UILabel = {
      let vg = UILabel()
        vg.font = UIFont.systemFont(ofSize: 9, weight: .light)
        vg.text = "100"
        
        return vg
        
    }()
    let passable: UILabel = {
      let vg = UILabel()
        vg.font = UIFont.systemFont(ofSize: 9, weight: .light)
        vg.text = "200"
        
        return vg
        
    }()
    let bad: UILabel = {
      let vg = UILabel()
        vg.font = UIFont.systemFont(ofSize: 9, weight: .light)
        vg.text = "350"
        
        return vg
        
    }()
    
    let verybad: UILabel = {
      let vg = UILabel()
        vg.font = UIFont.systemFont(ofSize: 9, weight: .light)
        vg.text = ">500"
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
