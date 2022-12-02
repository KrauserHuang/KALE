//
//  KLTabBarController.swift
//  KALE
//
//  Created by Tai Chin Huang on 2022/12/2.
//

import UIKit

class KLTabBarController: UITabBarController {
    
    private let tabs: [tab] = [.map, .community, .post, .profile]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
//        delegate = self
        tabBar.tintColor = .white
//        viewControllers = [createMapVC(), createCommunityVC(), createPostVC(), createProfileVC()]
        viewControllers = tabs.map { $0.setController(user: nil)}
    }
    
    private func configureTabBar() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground() // 設定tabBar成不透明，但會配合VC的背景色
//        tabBarAppearance.configureWithDefaultBackground()
        
        tabBar.overrideUserInterfaceStyle = .light
        
        tabBarAppearance.backgroundColor = .klCurry4
//        tabBarAppearance.stackedLayoutAppearance.normal.badgeBackgroundColor = .systemBrown

//        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = .black

//        let attributes = [
//            NSAttributedString.Key.foregroundColor: UIColor.black,
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium)
//        ]
//        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = attributes
//        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = attributes
        
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
    
//    private func createMapVC() -> UINavigationController {
//        let mapVC = MapVC()
//        mapVC.title = "Map"
//        mapVC.tabBarItem = UITabBarItem(title: "Map", image: SFSymbols.map, tag: 0)
//        let mapNC = UINavigationController(rootViewController: mapVC)
//        return mapNC
//    }
//    
//    private func createCommunityVC() -> UINavigationController {
//        let communityVC = CommunityVC()
//        communityVC.title = "Community"
//        communityVC.tabBarItem = UITabBarItem(title: "Community", image: SFSymbols.community, tag: 0)
//        let communityNC = UINavigationController(rootViewController: communityVC)
//        return communityNC
//    }
//    
//    private func createPostVC() -> UINavigationController {
//        let postVC = PostVC()
//        postVC.title = "Post"
//        postVC.tabBarItem = UITabBarItem(title: "Post", image: SFSymbols.post, tag: 0)
//        let postNC = UINavigationController(rootViewController: postVC)
//        return postNC
//    }
//    
//    private func createProfileVC() -> UINavigationController {
//        let profileVC = ProfileVC()
//        profileVC.title = "Profile"
//        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: SFSymbols.profile, tag: 0)
//        let profileNC = UINavigationController(rootViewController: profileVC)
//        return profileNC
//    }
}

private enum tab: Int {
    case map
    case community
    case post
    case profile
    
    func setController(user: User?) -> UIViewController {
        var controller: UIViewController

        switch self {
        case .map:          controller = UINavigationController(rootViewController: MapVC())
        case .community:    controller = UINavigationController(rootViewController: CommunityVC())
        case .post:         controller = UINavigationController(rootViewController: PostVC())
        case .profile:      controller = UINavigationController(rootViewController: ProfileVC())
        }
        controller.tabBarItem = tabBarItem
        controller.tabBarItem.imageInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        return controller
    }
    
    private var tabBarItem: UITabBarItem {
        switch self {
        case .map:          return UITabBarItem(title: "Map", image: SFSymbols.map, selectedImage: SFSymbols.mapSelected)
        case .community:    return UITabBarItem(title: "Community", image: SFSymbols.community, selectedImage: SFSymbols.community)
        case .post:         return UITabBarItem(title: "Post", image: SFSymbols.post, selectedImage: SFSymbols.postSelected)
        case .profile:      return UITabBarItem(title: "Profile", image: SFSymbols.profile, selectedImage: SFSymbols.profileSelected)
        }
    }
}
