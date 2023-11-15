//
//  LoginManager.swift
//  Login_Test
//
//  Created by Sunny on 11/15/23.
//

import Foundation
import KakaoSDKUser
import KakaoSDKAuth

enum LoginError: Error {
    case failedToGetAccessToken
}

final class LoginManager {

    typealias LoginResult = Result<String, Error>

    static let shared = LoginManager()

    private init() { }

}

// MARK: 카카오톡/카카오 로그인
extension LoginManager {

    func loginKakao() -> LoginResult {
        var result = LoginResult { String() }

        let loginCompletion: (OAuthToken?, Error?) -> Void = { oauthToken, error in
            if let error = error {
                result = LoginResult.failure(error)
            }
            else {
                guard let accessToken = oauthToken?.accessToken else {
                    result = LoginResult.failure(LoginError.failedToGetAccessToken)
                    return
                }
                result = LoginResult.success(accessToken)
            }
        }

        // 카카오톡 실행 가능 여부 확인
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk(completion: loginCompletion)
        }
        // 카카오 계정 로그인
        else {
            UserApi.shared.loginWithKakaoAccount(completion: loginCompletion)
        }

        return result
    }

    func logoutKakao() {
        UserApi.shared.logout { error in
            if let error = error {
                print(error)
            }
            else {
                print("logout() 성공")
            }
        }
    }

}
