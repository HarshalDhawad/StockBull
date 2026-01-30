//
//  GenericCOllectionViewCell.swift
//  StockBull
//
//  Created by Harshal Dhawad on 31/01/26.
//

import Foundation
import UIKit

class GenericCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "GenericCollectionViewCell"
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Stock"
        titleLabel.textColor = .systemGreen
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$150.00"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 10
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
