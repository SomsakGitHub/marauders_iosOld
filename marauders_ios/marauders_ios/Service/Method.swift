//
//  Method.swift
//  marauders_ios
//
//  Created by somsakKaeworasan on 4/9/2565 BE.
//

import Moya

extension Service {
    var method: Moya.Method {
        switch self {
        case .postTest, .register, .login:
            return .post
        case .webSocket:
            return .get
        }
    }
}
