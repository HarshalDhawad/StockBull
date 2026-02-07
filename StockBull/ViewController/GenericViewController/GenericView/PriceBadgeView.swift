//
//  PriceBadgeView.swift
//  StockBull
//
//  Created by Harshal Dhawad on 01/02/26.
//

import Foundation
import UIKit

class PriceBadgeView: UIView {
    
    private let arrowImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "arrow.up")
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemGreen
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "0.19%"
        label.textColor = .systemGreen
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor.systemGreen.withAlphaComponent(0.15)
        layer.cornerRadius = 8
        clipsToBounds = true
        
        stackView.addArrangedSubview(arrowImageView)
        stackView.addArrangedSubview(percentageLabel)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            arrowImageView.widthAnchor.constraint(equalToConstant: 14),
            arrowImageView.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    
}
