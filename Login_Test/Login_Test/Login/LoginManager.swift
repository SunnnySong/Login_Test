//
//  LoginManager.swift
//  Login_Test
//
//  Created by Sunny on 11/15/23.
//

import Foundation
import KakaoSDKUser

final class LoginManager {

    static let shared = LoginManager()

    private init() { }

}

// MARK: 카카오톡/카카오 로그인
extension LoginManager {
    
    func startKakaoLogin() {
        // 카카오톡 실행 가능 여부 확인
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoTalk() 성공")
                    print("oauthToken : \(oauthToken)")
                }
            }
        }
        // 카카오 계정 로그인
        else {
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() 성공")
                    print("oauthToken : \(oauthToken)")
                }
            }
        }
    }

}
