//
//  KLButton.swift
//  KALE
//
//  Created by Tai Chin Huang on 2022/12/6.
//

import UIKit

class KLButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String, systemImageName: String) {
        self.init(frame: .zero)
        set(color: backgroundColor, title: title, systemImageName: systemImageName)
    }
    
    convenience init(backgroundColor: UIColor, systemImageName: String) {
        self.init(frame: .zero)
//        configuration?.baseBackgroundColor = backgroundColor
        configuration?.baseForegroundColor = backgroundColor
        configuration?.image = UIImage(systemName: systemImageName)
    }
    
    private func configure() {
        configuration = .filled()
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    final func set(color: UIColor, title: String, systemImageName: String) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.title = title
        
        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
    }
}
