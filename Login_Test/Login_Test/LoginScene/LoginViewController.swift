//
//  ViewController.swift
//  Login_Test
//
//  Created by Sunny on 11/10/23.
//

import UIKit
import KakaoSDKUser

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func kakaoLoginButtonTapped(_ sender: Any) {
        print("카카오 로그인 버튼 눌림")
        self.startKakaoLogin()
    }

}

// MARK: 카카오톡 로그인
extension LoginViewController {

    private func startKakaoLogin() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoTalk() success.")
                    print("oauthToken : \(oauthToken)")
                }
            }
        }
    }

}

