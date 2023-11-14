//
//  SceneDelegate.swift
//  Login_Test
//
//  Created by Sunny on 11/10/23.
//

import UIKit
import KakaoSDKAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private var rootController: UINavigationController {
        return self.window?.rootViewController as? UINavigationController ?? UINavigationController()
    }

    private lazy var appCoordinator: Coordinator = self.makeAppCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = rootController
        self.window?.makeKeyAndVisible()

        appCoordinator.start()
    }

    // 카카오톡 로그인 과정 : 서비스앱 -> 카카오톡 이동 -> 사용자가 [동의하고 계속하기] 버튼을 누르거나 or 취소 버튼 -> 다시 서비스앱으로 이동
    // 카카오톡에서 다시 서비스앱으로 돌아왔을 때, 카카오 로그인 처리를 정상적으로 완료하기 위해 handleOpenUrl() 추가
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.handleOpenUrl(url: url)
            }
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }

    // MARK: Functions - Private
    private func makeAppCoordinator() -> Coordinator {
        return AppCoordinator(navigationController: self.rootController)
    }

}

