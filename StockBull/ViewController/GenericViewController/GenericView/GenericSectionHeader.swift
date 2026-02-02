//
//  GenericSectionHeader.swift
//  StockBull
//
//  Created by Harshal Dhawad on 01/02/26.
//

import Foundation
import UIKit

class GenericSectionHeader: UICollectionReusableView {
    
    static let reuseIdentifier = "GenericSectionHeader"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        image.setContentHuggingPriority(.defaultHigh, for: .vertical)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageView)
        
        addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
