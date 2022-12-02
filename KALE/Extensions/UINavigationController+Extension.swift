//
//  UINavigationController+Extension.swift
//  KALE
//
//  Created by Tai Chin Huang on 2022/12/2.
//

import UIKit

extension UINavigationController {
    static func makeNavigationController(rootViewController: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithDefaultBackground()
        navBarAppearance.backgroundColor = .white
        
        let attributes = [ // 設定navBar前景色與文字大小
            NSAttributedString.Key.foregroundColor: UIColor.klCurry1,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .medium)
        ]
        navBarAppearance.titleTextAttributes = attributes
        
        let backIndicatorImage = SFSymbols.arrow
        navBarAppearance.setBackIndicatorImage(backIndicatorImage, transitionMaskImage: backIndicatorImage)
        
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        navBarAppearance.backButtonAppearance = backButtonAppearance
        
        let controllerName = String(describing: type(of: rootViewController.self))
        
        [
            String(describing: MapVC.self),
            String(describing: CommunityVC.self),
            String(describing: PostVC.self),
            String(describing: ProfileVC.self)
        ].forEach { name in
            if name == controllerName {
                navBarAppearance.shadowColor = .clear
            }
        }
        
        // Status bar style
        [ String(describing: ProfileVC.self)].forEach { name in
            if name == controllerName {
                navController.navigationBar.overrideUserInterfaceStyle = .dark
            } else {
                navController.navigationBar.overrideUserInterfaceStyle = .light
            }
        }
        
        navController.navigationBar.standardAppearance = navBarAppearance
        navController.navigationBar.compactAppearance = navBarAppearance
        navController.navigationBar.scrollEdgeAppearance = navBarAppearance
        return navController
    }
}
