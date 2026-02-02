//
//  HomeViewController.swift
//  StockBull
//
//  Created by Harshal Dhawad on 30/01/26.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private var headerView: HeaderView!
    private var collectionView: BasicCollectionView!
    
    private let sellButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Sell", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let buyButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Buy", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHeaderView()
        setupButtons()
        setupWatchlistView()
        setupConstraints()
    }
    
    func setupHeaderView() {
        headerView = HeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
    }
    
    func setupButtons() {
        view.addSubview(sellButton)
        view.addSubview(buyButton)
    }
    
    func setupWatchlistView() {
        collectionView = BasicCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            buyButton.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buyButton.widthAnchor.constraint(equalToConstant: 100),
            buyButton.heightAnchor.constraint(equalToConstant: 44),
            
            sellButton.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 10),
            sellButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sellButton.widthAnchor.constraint(equalToConstant: 100),
            sellButton.heightAnchor.constraint(equalToConstant: 44),
            
            collectionView.topAnchor.constraint(equalTo: buyButton.bottomAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}
