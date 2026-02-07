//
//  BasicCollectionView.swift
//  StockBull
//
//  Created by Harshal Dhawad on 31/01/26.
//

import Foundation
import UIKit

class BasicCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
    init() {
        let layout = UICollectionViewFlowLayout()
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        setupCollectionView()
    }
    
    // Required boilerplate
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView() {
        self.delegate = self
        self.dataSource = self
        self.register(GenericSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: GenericSectionHeader.reuseIdentifier)
        self.register(GenericCollectionViewCell.self, forCellWithReuseIdentifier: GenericCollectionViewCell.reuseIdentifier)
        self.backgroundColor = .clear
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenericCollectionViewCell.reuseIdentifier, for: indexPath) as? GenericCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.bounds.width
            return CGSize(width: width, height: 80)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GenericSectionHeader.reuseIdentifier, for: indexPath) as? GenericSectionHeader else {
                return UICollectionReusableView()
            }
            header.titleLabel.text = "Watchlist"
            return header
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}
