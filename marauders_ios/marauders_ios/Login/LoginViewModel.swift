//
//  LoginViewModel.swift
//  marauders_ios
//
//  Created by admin on 20/2/2565 BE.
//

import RxSwift

class LoginViewModel: BaseViewModel {
    
    func login(service: Service) -> Observable<LoginModel> {
        return requestToServer(service: service)
            .map(LoginModel.self)
    }
}
