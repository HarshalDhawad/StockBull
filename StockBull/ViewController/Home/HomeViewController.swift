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
    private var portfolioView: PortfolioSummaryView!
    
    private let sellButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Sell", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel.map { $0.font = UIFont.boldSystemFont(ofSize: 25) }
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let buyButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Buy", for: .normal)
        btn.titleLabel.map { $0.font = UIFont.boldSystemFont(ofSize: 25) }
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let seeMore: UIButton = {
        let btn = UIButton()
        btn.setTitle("See More", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel.map { $0.font = UIFont.boldSystemFont(ofSize: 15) }
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            
            // 1. Setup the ScrollView hierarchy first
            setupScrollView()
            
            // 2. Add subviews to the CONTENT VIEW (not the main view)
            setupSubviews()
            
            // 3. Set constraints relative to the CONTENT VIEW
            setupConstraints()
        }
        
        func setupScrollView() {
            view.addSubview(scrollView)
            scrollView.addSubview(contentView)
            
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
                contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
            ])
        }
        
        func setupSubviews() {
            headerView = HeaderView()
            portfolioView = PortfolioSummaryView()
            collectionView = BasicCollectionView()
            
            // Add EVERYTHING to contentView
            [headerView, portfolioView, buyButton, sellButton, collectionView, seeMore].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview($0)
            }
            
            collectionView.isScrollEnabled = false
        }
        
        func setupConstraints() {
            NSLayoutConstraint.activate([
                // Header: Top of ContentView
                headerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                
                // Portfolio: Below Header
                portfolioView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
                portfolioView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                portfolioView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                
                // Buttons: Below Portfolio
                buyButton.topAnchor.constraint(equalTo: portfolioView.bottomAnchor, constant: 20),
                buyButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
                buyButton.widthAnchor.constraint(equalToConstant: 140),
                buyButton.heightAnchor.constraint(equalToConstant: 70),
                
                sellButton.topAnchor.constraint(equalTo: portfolioView.bottomAnchor, constant: 20),
                sellButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
                sellButton.widthAnchor.constraint(equalToConstant: 140),
                sellButton.heightAnchor.constraint(equalToConstant: 70),
                
                // CollectionView: Below Buttons
                collectionView.topAnchor.constraint(equalTo: buyButton.bottomAnchor, constant: 30),
                collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                collectionView.heightAnchor.constraint(equalToConstant: 600),
                
                seeMore.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
                seeMore.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
                seeMore.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
}
