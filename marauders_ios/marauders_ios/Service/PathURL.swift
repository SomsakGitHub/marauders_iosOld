//
//  PathURL.swift
//  marauders_ios
//
//  Created by admin on 7/9/2565 BE.
//

import Moya

extension Service {
    var baseURL: URL {
        switch self {
        case .postTest:
            return URL(string: Constants.baseUrlTest)!
        default:
            return URL(string: Constants.baseUrl)!
        }
    }
    
    var path: String {
        switch self {
        case .postTest:
            return "api-clients"
        case .register:
            return "userRoute/register"
        case .login:
            return "userRoute/login"
        case .webSocket:
            return "webSocketRoute"
        }
    }
}
