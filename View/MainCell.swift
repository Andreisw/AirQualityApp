//
//  MainCell.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit

class MainCell: UICollectionViewCell {
  
    var city: String!
    lazy var heatherView = HeatherView(city: "city")
    let layout = UICollectionViewFlowLayout()
    lazy var headerCollectionView = HeaderCollectionView(collectionViewLayout: layout)
    
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        self.layout.scrollDirection = .vertical

        addSubview(headerCollectionView.view)
        headerCollectionView.view.frame = self.frame
        heatherView.view.frame = CGRect(x: 0, y: 0, width: frame.width, height: 600 )
        addSubview(heatherView.view)
    
        
        headerCollectionView.heather = heatherView
    }
    
    func adddVity(ciy:String) {
        heatherView.cityName.text = ciy
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
       
    }
  
   
}
