//
//  SceneDelegate.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: sceneWindow)
        window?.rootViewController = ListAssembler().assemly()
        window?.makeKeyAndVisible()
    }
}

