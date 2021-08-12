//
//  CustomSlider.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 12.08.2021.
//

import Foundation
import UIKit

class CustomSlider : UISlider {
   
   @IBInspectable open var trackWidth:CGFloat = 10 {
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
