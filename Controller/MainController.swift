//
//  MainController.swift
//  AirQualityApp
//
//  Created by Andrei Cojocaru on 11.08.2021.
//

import Foundation
import UIKit


struct ListViews {
    
    var v = ["Bucuresti","Braila","Cernavoda","Contanta"]
    
    
}

class MainController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    
    var l = ListViews()
    lazy  var views = l.v
    var m = MainCell()
    
    
    private let pageControll: UIPageControl = {
        let page = UIPageControl()
        page.currentPage = 0
        page.numberOfPages = 20
        page.currentPageIndicatorTintColor = .black
        page.pageIndicatorTintColor = . lightGray
        
        return page
    }()
    
    
    
    let newCityButton : UIButton = {
        let newCity = UIButton()
        newCity.addTarget(self, action: #selector(goToSearch), for: .touchUpInside)
        newCity.setImage(UIImage(named: "compass"), for: .normal)
        newCity.layer.opacity = 0.9
        
        return newCity
    }()
    
    let newView: UIView = {
        let new = UIView()
        new.backgroundColor = #colorLiteral(red: 0.921477735, green: 0.9216321707, blue: 0.9214574099, alpha: 1)
        new.layer.shadowColor = UIColor.white.cgColor
        new.layer.shadowRadius = 5
        new.layer.shadowOpacity = 0.5
        new.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        return new
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.isPagingEnabled = true
        setupNewCityButton()
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return views.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCell
        cell.isHidden = false
        
        cell.adddVity(ciy: views[indexPath.row])
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    @objc func goToSearch() {
        
        print("tap")
        let vc = CitiesListViewController()
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func setupNewCityButton() {
        
        
        newView.addSubview(newCityButton)
        
        newCityButton.translatesAutoresizingMaskIntoConstraints = false
        
        newCityButton.centerYAnchor
            .constraint(equalTo: newView.centerYAnchor).isActive = true
        newCityButton.trailingAnchor.constraint(equalTo: newView.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
        newCityButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        newCityButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        
        
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        newView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        newView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        newView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        
        
        newView.addSubview(pageControll)
        
        pageControll.translatesAutoresizingMaskIntoConstraints = false
        pageControll.centerYAnchor.constraint(equalTo: newView.centerYAnchor).isActive = true
        pageControll.centerXAnchor.constraint(equalTo: newView.centerXAnchor).isActive = true
        pageControll.heightAnchor.constraint(equalTo: newView.heightAnchor, multiplier: 0.5).isActive = true
        pageControll.widthAnchor.constraint(equalTo: newView.widthAnchor, multiplier: 0.4).isActive = true
    }
    
}
