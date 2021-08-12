//
//  HeaderCollectionViewCell.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit

class Air: NSObject {
    
    @objc var components = [Int]() {
        willSet { willChangeValue(forKey: #keyPath(components))}
        didSet{ didChangeValue(for: \Air.components)}
    }
}

class HeaderCollectionView: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var airManger = AirQualityService()
    var heather : HeatherView? = nil
    var componentsTitle = ["PM 25", "PM 10","CO2", "SO2","NO2", "O3"]
    var myArray = [Int]()
    
    @objc var airObject = Air() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var componentsToken: NSKeyValueObservation? = nil
    
    override func viewDidLoad() {
        collectionView.showsHorizontalScrollIndicator = false
        
        componentsToken = observe(\HeaderCollectionView.airObject.components, options:  .new, changeHandler: { headerCollection, change in
            
            guard let updateList = change.newValue else {return}
            headerCollection.myArray = updateList
        })
        
        setupCollectionView()
    }
    
    
    fileprivate func fetchAirPosts() {
        
        AirService.fetchPosts { res in
            switch res {
            case.failure(let err):
                print("Failed to load", err)
            case .success(let posts):
                print(posts)
                
                self.airObject.components.append(Int(posts.data[0].pm25))
                self.airObject.components.append(Int(posts.data[0].pm10))
                self.airObject.components.append(Int(posts.data[0].co))
                self.airObject.components.append(Int(posts.data[0].so2))
                self.airObject.components.append(Int(posts.data[0].no2))
                self.airObject.components.append(Int(posts.data[0].o3))
            }
        }
    }
    
    // MARK: Setup COllection View
    
    func setupCollectionView() {
        
        
        collectionView.register(ComponentsCell.self, forCellWithReuseIdentifier: "componentsCell")
        collectionView.register(GraphCell.self, forCellWithReuseIdentifier: "graphCell")
        collectionView.contentInset = UIEdgeInsets(top: 500, left: 30, bottom: 50, right: 30)
        collectionView.allowsSelection = false
        collectionView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    //    func numberOfItems(inSection section: Int) -> Int {
    //
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return componentsTitle.count
        }else {
            return 1
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "componentsCell", for: indexPath) as! ComponentsCell
            cell.titleLable.text = componentsTitle[indexPath.row]
            return cell
        }else {
            let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: "graphCell", for: indexPath) as! GraphCell
            
            return newCell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: 160, height: 150)
        }else {
            return CGSize(width: collectionView.frame.width * 0.85 , height: collectionView.frame.height * 0.4)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        else {
            return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        }
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        let y = -scrollView.contentOffset.y
        let alphaPercent = (-scrollView.contentOffset.y - 450) / 100
        let alphaPercentTWO = (-scrollView.contentOffset.y + 450) / 100
        
        
        
        print(alphaPercentTWO)
        
        let height = max(y,300)
        heather?.view.frame = CGRect(x: 0, y: 0, width: collectionView.frame.width, height: height)
        
        
        
        if scrollView.contentOffset.y > -650 {
            
            heather?.hideIndex.alpha = 0
            heather?.airHideValue.alpha = 0
            heather?.airQualityData.alpha = alphaPercent
            heather?.cercleView.alpha = alphaPercent
            
            
        }
        if y < 340 {
            heather?.hideIndex.alpha = 1
            heather?.airHideValue.alpha = 1
            heather?.cercleView.alpha = alphaPercent
            heather?.airQualityData.alpha = alphaPercent
        }
        
    }
}

