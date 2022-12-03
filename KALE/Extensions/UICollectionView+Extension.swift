//
//  UICollectionView+Extension.swift
//  KALE
//
//  Created by Tai Chin Huang on 2022/12/3.
//

import UIKit

extension UICollectionReusableView {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
