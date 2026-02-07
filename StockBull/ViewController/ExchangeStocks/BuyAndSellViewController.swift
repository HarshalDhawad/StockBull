//
//  BuyAndSellViewController.swift
//  StockBull
//
//  Created by Harshal Dhawad on 07/02/26.
//

import Foundation
import UIKit

class BuyAndSellViewController: UIViewController {
    
    let type: String
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.layer.borderColor = UIColor.black.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 15
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let btnStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        stackView.layer.cornerRadius = 20
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let portfoilio: UIButton = {
        let btn = UIButton()
        btn.setTitle("Your PortFolio", for: .normal)
        btn.titleLabel.map { $0.font = UIFont.boldSystemFont(ofSize: 15) }
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 20
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(handleClick(_:)), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let watchList: UIButton = {
        let btn = UIButton()
        btn.setTitle("WatchList", for: .normal)
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 20
        btn.titleLabel.map { $0.font = UIFont.boldSystemFont(ofSize: 15) }
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(handleClick(_:)), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let textBox: UITextField = {
        let textBox = UITextField()
        textBox.placeholder = "Search"
        textBox.setContentHuggingPriority(.defaultHigh, for: .vertical)
        textBox.translatesAutoresizingMaskIntoConstraints = false
        return textBox
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "slider.horizontal.3")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(type: String) {
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = type
        setupSearchBar()
        setupButton()
        setupCollectionView()
        if self.type == "Sell" {
            setupSellView()
        } else {
            setupBuyView()
        }
        
    }
    
    func setupSearchBar() {
        view.backgroundColor = .white
        
        // 1. Add subviews to stack
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textBox)
        stackView.addArrangedSubview(iconImageView)
        
        // 2. Set margins for the stack view content
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        view.addSubview(stackView)
        
        // 3. Set the text box to stretch
        textBox.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        NSLayoutConstraint.activate([
            // Constraint stack to the top/sides of the screen
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 45), // Height is fine, Width was the issue
            
            // Icons only need height and width; StackView handles the rest
            imageView.widthAnchor.constraint(equalToConstant: 24),
            imageView.heightAnchor.constraint(equalToConstant: 24),
            
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func setupButton() {
        btnStackView.addArrangedSubview(portfoilio)
        btnStackView.addArrangedSubview(watchList)
        
        view.addSubview(btnStackView)
        
        NSLayoutConstraint.activate([
            btnStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            btnStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnStackView.heightAnchor.constraint(equalToConstant: 45), // Height is fine, Width was the issue
            
            portfoilio.heightAnchor.constraint(equalToConstant: 45),
            watchList.heightAnchor.constraint(equalToConstant: 45),
            
        ])
        
    }
    
    func setupCollectionView() {
        let collectionView = BasicCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: btnStackView.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
        ])
    }
    
    func setupSellView() {
        
    }
    
    func setupBuyView() {
        
    }
    
    @objc func handleClick(_ sender: UIButton) {
        [portfoilio, watchList].forEach { button in
            button.backgroundColor = .clear
            button.setTitleColor(.black, for: .normal)
        }
        sender.backgroundColor = .systemBlue
        sender.setTitleColor(.white, for: .normal)
    }
}
