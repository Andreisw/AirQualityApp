//
//  SearchViewController.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit

class SearchViewController: UIView {
  private  var searchBar = DropDowns()
    
    let seatchTitle: UILabel = {
        let search = UILabel()
        search.text = "Find new city"
        search.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        
        return search
        
    }()
    let imageContainer = UIView()
    let openViewArrow : UIButton = {
        let open = UIButton()
        
        let large = UIImage.SymbolConfiguration(pointSize: 18, weight: .bold, scale: .large)
        open.setImage(UIImage(systemName: "control",withConfiguration: large), for: .normal)
        open.imageView?.contentMode = .scaleToFill
        open.imageView?.tintColor = .black
        
        
        return open
        
        
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        layer.cornerRadius = 30
        layer.masksToBounds = true
       
        setupSearchBar()
        setupArrow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  //  MARK: Setup contraints for arrow button Open close search view
    
    func setupArrow() {
        
        addSubview(imageContainer)
        
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageContainer.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10).isActive = true
        imageContainer.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        imageContainer.addSubview(openViewArrow)
        
        openViewArrow.translatesAutoresizingMaskIntoConstraints = false
        openViewArrow.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
        openViewArrow.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor).isActive = true
        openViewArrow.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = true
        openViewArrow.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
        
        openViewArrow.transform = CGAffineTransform(rotationAngle: .pi)
        
    }
    
    // MARK: Setup contraints for search bar
    func setupSearchBar() {
        
        addSubview(searchBar)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20).isActive = true
        searchBar.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.05).isActive = true
        searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 70 ).isActive = true
        
        
        addSubview(seatchTitle)
        
        seatchTitle.translatesAutoresizingMaskIntoConstraints = false
        seatchTitle.bottomAnchor.constraint(equalTo: searchBar.topAnchor,constant: -10).isActive = true
        seatchTitle.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor).isActive = true
    }
}
