//
//  AppDelegate.swift
//  MyUnsplashApp
//
//  Created by Abdullah Yalçın on 12.07.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIWindowHelper().getTabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
        let backgroundView = UIView()
        backgroundView.frame = window!.frame
        backgroundView.tag = 221122
       // backgroundView.backgroundColor = R.color.colorWhite()
        
       /* let imageView = UIImageView(image: R.image.moneytoliaLogo())
        
        imageView.frame = CGRect(x: (backgroundView.frame.size.width / 2) - (83 / 2),y: (backgroundView.frame.height / 2) - (71 / 2), width: 83, height: 71)
        
        backgroundView.addSubview(imageView)*/
        
        self.window?.addSubview(backgroundView)
        self.window?.endEditing(false)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        self.window?.viewWithTag(221122)?.removeFromSuperview()
    }


}



