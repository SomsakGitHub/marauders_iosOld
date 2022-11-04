//
//  Task.swift
//  marauders_ios
//
//  Created by admin on 7/9/2565 BE.
//

import Moya

extension Service {
    var task: Task {
        switch self {
        case let .postTest(clientName, clientEmail):
            return .requestParameters(parameters: ["clientName": clientName,
                                                   "clientEmail": clientEmail],
                                      encoding: JSONEncoding.default)
        case let .register(email):
            return .requestParameters(parameters: ["email": email],
                                      encoding: JSONEncoding.default)
        case let .login(username, password):
            return .requestParameters(parameters: ["username": username,
                                                   "password": password],
                                      encoding: JSONEncoding.default)
        case .webSocket:
            return .requestPlain
        }
    }
}
