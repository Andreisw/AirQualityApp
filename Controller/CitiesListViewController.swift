//
//  CitiesListViewController.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit


class CitiesListViewController: UIViewController {
    
    var open = true

    var filterView: UIView = {
        let filter = UIView()
        filter.backgroundColor = .black
        filter.alpha = 0.0
        
        return filter
        
        
    }()
   
    let searchViewController = SearchViewController()
    var heighAnchr: NSLayoutConstraint!

    let layout = UICollectionViewFlowLayout()
    lazy var searchCollection = UICollectionView(frame: view.frame, collectionViewLayout: layout)

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        searchViewController.openViewArrow.addTarget(self, action: #selector(expandView), for: .touchUpInside)

        
        view.backgroundColor = .white
        view.addSubview(searchCollection)
        setupSearchCollection()
        
        view.addSubview(filterView)
        
        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        filterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        filterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        filterView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(searchViewController)
        
        searchViewController.translatesAutoresizingMaskIntoConstraints = false
        searchViewController.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchViewController.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchViewController.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        heighAnchr = searchViewController.heightAnchor.constraint(equalTo:view.heightAnchor,multiplier: 0.13)
        heighAnchr.isActive = true
        
        
      
        
        
    }
    
    @objc func expandView() {
       

    print(open)
        if open == true {
            
            
            heighAnchr.isActive = false
            heighAnchr = searchViewController.heightAnchor.constraint(equalTo:view.heightAnchor,multiplier: 0.9)
            heighAnchr.isActive = true
          
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
                self.filterView.alpha = 0.7
                self.searchViewController.openViewArrow.transform = CGAffineTransform(rotationAngle: 2 * .pi)
            }
        }
        if open == false {
            
            
            heighAnchr.isActive = false
            heighAnchr = searchViewController.heightAnchor.constraint(equalTo:view.heightAnchor,multiplier: 0.13)
            heighAnchr.isActive = true
            
          
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
                self.filterView.alpha = 0.0
                self.searchViewController.openViewArrow.transform = CGAffineTransform(rotationAngle:  .pi)
                self.filterView.alpha = 0.0
                
            }
        }
        
        
        open = !open
       print(open)
    }
  
    
    func setupSearchCollection() {
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        
        searchCollection.register(CitiesCell.self, forCellWithReuseIdentifier: "searchCell")
        searchCollection.delegate = self
        searchCollection.dataSource = self
        searchCollection.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        searchCollection.translatesAutoresizingMaskIntoConstraints = false
        searchCollection.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        searchCollection.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
       
    }
}

extension CitiesListViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = searchCollection.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as! CitiesCell
       
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 30
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 5
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset  = CGSize(width: 10, height: 10)
        cell.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: 20).cgPath
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width * 0.9, height: view.frame.height * 0.25)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       dismiss(animated: true, completion: nil)
    }
}
