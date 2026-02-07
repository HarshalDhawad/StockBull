//
//  PortfolioSummaryView.swift
//  StockBull
//
//  Created by Harshal Dhawad on 06/02/26.
//

import UIKit

class PortfolioSummaryView: UIView {
    
    // MARK: - UI Components
    
    private let totalAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "TOTAL AMOUNT"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    private let demoBadge: UILabel = {
        let label = UILabel()
        label.text = " Demo "
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textColor = .systemGreen
        label.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.1)
        label.layer.cornerRadius = 4
        label.clipsToBounds = true
        return label
    }()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "€9,968.00"
        label.font = .systemFont(ofSize: 42, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let changeBadge = PriceBadgeView() // Reusing the badge we created earlier
    
    private let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // Placeholder for the Chart (You can use a library like DGCharts or a custom view)
    private let chartPlaceholder: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.05)
        view.layer.cornerRadius = 12
        return view
    }()

    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = UIColor(red: 0.05, green: 0.05, blue: 0.1, alpha: 1.0) // Dark theme
        layer.cornerRadius = 20
        
        addSubview(mainStackView)
        
        // Assemble Top Section
        mainStackView.addArrangedSubview(totalAmountLabel)
        mainStackView.addArrangedSubview(demoBadge)
        mainStackView.addArrangedSubview(balanceLabel)
        mainStackView.addArrangedSubview(changeBadge)
        
        // Add space and then the chart area
        mainStackView.setCustomSpacing(30, after: changeBadge)
        mainStackView.addArrangedSubview(chartPlaceholder)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            // Give the chart area a fixed height for now
            chartPlaceholder.widthAnchor.constraint(equalTo: mainStackView.widthAnchor),
            chartPlaceholder.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
