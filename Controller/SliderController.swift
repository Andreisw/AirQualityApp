//
//  SliderController.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit

class ComponenetsSlider : UISlider {
    
    
    
    @IBInspectable open var trackWidth:CGFloat = 6 {
        didSet {setNeedsDisplay()}
        
        
    }
    
    override open func trackRect(forBounds bounds: CGRect) -> CGRect {
        let defaultBounds = super.trackRect(forBounds: bounds)
        return CGRect(
            x: defaultBounds.origin.x,
            y: defaultBounds.origin.y + defaultBounds.size.height/2 - trackWidth/4,
            width: defaultBounds.size.width,
            height: trackWidth
            
            
        )
    }
}



class SliderView: UIViewController {
    
    
    var color:UIColor
    var component:String
    var sliderValue:Float
    
    var  slider = ComponenetsSlider()
    let valueName: UILabel = {
        let value = UILabel()
        value.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        value.textAlignment = .right
        value.textColor = .black
        
        return value
        
    }()
    let componentsValue: UILabel = {
        let components = UILabel()
        components.font = UIFont.systemFont(ofSize: 6, weight: .light)
        components.textColor = .black
        
        return components
        
    }()
    
    
    
    init(color:UIColor,component:String,sliderValue:Float) {
        
        self.color = color
        self.component = component
        self.sliderValue = sliderValue
        
        super.init(nibName: nil, bundle: nil)
        slider.tintColor = color
        slider.setValue(sliderValue, animated: true)
        valueName.text = component
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        
        view.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        slider.widthAnchor.constraint(equalToConstant: 160).isActive = true
        slider.thumbTintColor = .clear
        
        
        view.addSubview(valueName)
        valueName.translatesAutoresizingMaskIntoConstraints = false
        valueName.trailingAnchor.constraint(equalTo: slider.leadingAnchor,constant: -5).isActive = true
        valueName.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        valueName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}
