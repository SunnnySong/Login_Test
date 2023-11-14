//
//  AppCoordinator.swift
//  Login_Test
//
//  Created by Sunny on 11/15/23.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        runLoginFlow()
    }

    // 현재 token이 keyChain에 존재하는지
    // 즉, 현재 로그인 토큰 상태 확인하고 로그인이 안되어있다면 로그인 화면
    // 로그인이 되어있다면 바로 홈 화면

    // MARK: Functions - Private
    private func runLoginFlow() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")

        navigationController.pushViewController(loginViewController, animated: true)
    }

    private func runHomeFlow() {

    }

}
