//
//  ComponentsCell.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit


class ComponentsCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let titleLable: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 23, weight: .bold)
    
        
        return title
    }()
    let particulateMatter : UILabel = {
       let particulate = UILabel()
        particulate.font = UIFont.systemFont(ofSize: 10, weight: .light)
        particulate.textColor = .darkGray
        particulate.text = "particulate matter"
        
        return particulate
    }()
    let value: UILabel = {
        let value = UILabel()
        value.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        value.textColor = #colorLiteral(red: 0.1310402453, green: 0.3937974572, blue: 0.9513605237, alpha: 1)
        value.text =  "231.4"
        
        return value
    
        
    }()
    let norm: UILabel = {
        let value = UILabel()
        value.font = UIFont.systemFont(ofSize: 14, weight: .light)
        value.textColor = .darkGray
        value.text =  "% of norm"
        
        return value
    
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellText()
    }
    
    override func layoutSubviews() {
        
        layer.backgroundColor = UIColor.white.cgColor
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupCellText() {
       
        
        addSubview(titleLable)
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        titleLable.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15).isActive = true
        titleLable.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25).isActive = true
        
        addSubview(particulateMatter)
        
        particulateMatter.translatesAutoresizingMaskIntoConstraints = false
        particulateMatter.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: -20).isActive = true
        particulateMatter.leadingAnchor.constraint(equalTo: titleLable.leadingAnchor).isActive = true
        particulateMatter.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.25).isActive = true
        
        let valuesStack = UIStackView(arrangedSubviews: [value,norm])
        valuesStack.distribution = .fillEqually
        valuesStack.setCustomSpacing(-15, after: value)
        
        valuesStack.axis = .vertical
        
        addSubview(valuesStack)
        valuesStack.translatesAutoresizingMaskIntoConstraints = false
        valuesStack.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 5).isActive = true
        valuesStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20).isActive = true
        valuesStack.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.4).isActive = true
    }
}
