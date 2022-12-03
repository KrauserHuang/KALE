//
//  UIView+Extension.swift
//  KALE
//
//  Created by Tai Chin Huang on 2022/12/3.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
