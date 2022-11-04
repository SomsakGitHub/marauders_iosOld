//
//  Service.swift
//  marauders_ios
//
//  Created by admin on 20/2/2565 BE.
//

import Moya

enum Service {
    case postTest(clientName: String, clientEmail: String)
    case register(email: String)
    case login(username: String, password: String)
    case webSocket
}

extension Service: TargetType {
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }
}


