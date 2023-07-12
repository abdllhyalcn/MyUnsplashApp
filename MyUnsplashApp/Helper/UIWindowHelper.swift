//
//  UIWindowHelper.swift
//  MyUnsplashApp
//
//  Created by Abdullah Yalçın on 12.07.2023.
//

import Foundation
import UIKit

class UIWindowHelper {
   
    func getTabBarController() -> UITabBarController {
        let tabViewController1 = getNavigationController(HomeViewController(), UITabBarItem(title: R.string.localizable.tabHomeTitle(), image: R.image.tabHome(), tag: 0))
        let tabViewController2 = getNavigationController(ImagesViewController(), UITabBarItem(title: R.string.localizable.tabImagesTitle(), image: R.image.tabImages(), tag: 1))
        let tabViewController3 = getNavigationController(InformationViewController(), UITabBarItem(title: R.string.localizable.tabInformationTitle(), image: R.image.tabInformation(), tag: 2))
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [tabViewController1 , tabViewController2 , tabViewController3]
        
        return tabBarController
    }
    
    private func getNavigationController(_ viewController: UIViewController, _ tabItem: UITabBarItem) -> UINavigationController {
        let nav = UINavigationController()
        nav.isNavigationBarHidden = false
        nav.viewControllers = [viewController]
        nav.tabBarItem = tabItem
        return nav
    }
}
