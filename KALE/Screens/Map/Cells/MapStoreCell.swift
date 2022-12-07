//
//  MapStoreCell.swift
//  KALE
//
//  Created by Tai Chin Huang on 2022/12/3.
//

import UIKit

protocol MapStoreCellDelegate: AnyObject {
    func didTapBookmarkButton()
}

class MapStoreCell: UICollectionViewCell {
    
    let storeIconImage  = UIImageView()
    let rateView        = UIView()
    let bookmarkButton  = KLButton(backgroundColor: .black, systemImageName: "bookmark")
    let titleLabel      = KLTitleLabel(textAlignment: .left, fontSize: 20)
    let typeLabel       = KLSecondaryTitleLabel(fontSize: 18)
    let costLevelLabel  = KLSecondaryTitleLabel(fontSize: 18)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(with model: Store) {
        storeIconImage.image = Images.placeholder
        rateView.backgroundColor = .systemPink
        titleLabel.text = "title"
        typeLabel.text = "歐式"
        costLevelLabel.text = "好貴"
        bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
    }
    
    private func configure() {
        layer.cornerRadius = 8
        clipsToBounds = true
        backgroundColor = .white
        
        addSubviews(storeIconImage, rateView, bookmarkButton, titleLabel, typeLabel, costLevelLabel)
        
        storeIconImage.translatesAutoresizingMaskIntoConstraints = false
        rateView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            storeIconImage.topAnchor.constraint(equalTo: topAnchor),
            storeIconImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            storeIconImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            storeIconImage.widthAnchor.constraint(equalTo: storeIconImage.heightAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: storeIconImage.trailingAnchor, constant: padding),
//            titleLabel.trailingAnchor.constraint(equalTo: rateView.leadingAnchor, constant: 8),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            rateView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            rateView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: padding),
            rateView.trailingAnchor.constraint(equalTo: bookmarkButton.leadingAnchor, constant: -padding),
            rateView.heightAnchor.constraint(equalToConstant: 25),
            
            bookmarkButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            bookmarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            bookmarkButton.widthAnchor.constraint(equalToConstant: 25),
            bookmarkButton.heightAnchor.constraint(equalTo: bookmarkButton.widthAnchor),
            
            
            typeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            typeLabel.heightAnchor.constraint(equalToConstant: 20),
            typeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            
            costLevelLabel.centerYAnchor.constraint(equalTo: typeLabel.centerYAnchor),
            costLevelLabel.leadingAnchor.constraint(equalTo: typeLabel.trailingAnchor, constant: padding),
            costLevelLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            costLevelLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
}
