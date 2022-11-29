//
//  AppDelegate.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let searchviewController = SearchViewController()
        let navigationController = UINavigationController(rootViewController: searchviewController)

        SearchConfiguration.configureModule(viewController: searchviewController)
        window = UIWindow()

        //MARK: Force the appearance to light mode
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        window?.rootViewController = navigationController

        window?.makeKeyAndVisible()
        return true
    }

}
