//
//  SceneDelegate.swift
//  MVVMPattern
//
//  Created by jinseo park on 1/22/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            debugPrint("scene problem")
            return
        }
        window = UIWindow(windowScene: windowScene)
        let mainVC = ViewController()
        
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
    }
}

