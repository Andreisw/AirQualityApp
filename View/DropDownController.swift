//
//  DropDownController.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit
import MapKit



class DropDowns: UIView {
    
    //MARK - Properties
    
    let imageContainer = UIView()
    let magnnifier = UIImageView(image: UIImage(systemName: "magnifyingglass"))
    
    lazy var arrayS = [""]
    var searchDrop = DropDown()
    
    fileprivate func fetchAirPosts() {
        print("TEST")
        DispatchQueue.main.async {
            CitiesApi.shared.fetchPosts { res in
                switch res {
                case.failure(let err):
                    print("Failed to load", err)
                case .success(let posts):
                    
                    for x in 0...4000 {
                        self.arrayS.append(posts.data[x].city)
                        self.searchDrop.optionArray = self.arrayS
                    }
                }
            }
        }
    }
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        fetchAirPosts()
        print("load")
        
        
        addSubview(searchDrop)
        
        searchDrop.translatesAutoresizingMaskIntoConstraints = false
        
        searchDrop.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        searchDrop.leadingAnchor.constraint(equalTo: leadingAnchor ).isActive = true
        searchDrop.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        searchDrop.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchDrop.optionArray = arrayS
        
        searchDrop.backgroundColor = CustomColors.mainBlue
        
        searchDrop.isSearchEnable = true
        searchDrop.selectedRowColor = .clear
        searchDrop.rowBackgroundColor = .clear
        //        searchDrop.dropShadow()
        searchDrop.arrowColor = .clear
        searchDrop.arrowSize = 0
        searchDrop.layer.cornerRadius = 20
        searchDrop.layer.masksToBounds = true
        
        
        searchDrop.addSubview(imageContainer)
        
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.topAnchor.constraint(equalTo: searchDrop.topAnchor).isActive = true
        imageContainer.trailingAnchor.constraint(equalTo: searchDrop.trailingAnchor).isActive = true
        imageContainer.bottomAnchor.constraint(equalTo: searchDrop.bottomAnchor).isActive = true
        imageContainer.widthAnchor.constraint(equalTo: searchDrop.widthAnchor,multiplier: 0.15).isActive = true
        
        
        
        imageContainer.addSubview(magnnifier)
        
        magnnifier.translatesAutoresizingMaskIntoConstraints = false
        magnnifier.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor).isActive = true
        magnnifier.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor).isActive = true
        magnnifier.contentMode = .scaleAspectFill
        magnnifier.tintColor = .white
        
        searchDrop.didSelect { x, z, y in
            
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

