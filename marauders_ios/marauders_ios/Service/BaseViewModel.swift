//
//  BaseViewModel.swift
//  marauders_ios
//
//  Created by admin on 20/2/2565 BE.
//

import RxSwift
import Moya

class BaseViewModel {
    
    private let provider = MoyaProvider<Service>(plugins: [NetworkLoggerPlugin()])
    private let baseViewController = BaseViewController()
    
//    let disposeBag = DisposeBag()
//    let activityIndicator: UIActivityIndicatorView!
    
    init() {
//        activityIndicator = UIActivityIndicatorView()
//        activityIndicator?.asObservable().bind(to: progress.showProgress).disposed(by: disposeBag)
        self.baseViewController.startIndicator()
    }
    
    func requestToServer(service: Service) -> Observable<Response> {
        print("provider=>", provider)
        
        return provider.rx
            .request(service)
            .filterSuccess()
            .debug()

    }
    

}

extension ObservableType where Element == Response {
    func filterSuccess() -> Observable<Element> {
        return flatMap { response -> Observable<Element> in
            print("request: \(response.request)")
            print("response: \(response.response)")
//            do {
//                let fetchedEntities = try response.mapString()
//                print(fetchedEntities)
//            } catch {
//                print(error)
//            }
//
//            if response.statusCode == 401 {
//                return Observable.error("Error Status Unauthorized.".toError(response.statusCode))
//            }
//
//            if response.statusCode == 500 {
//                return Observable.error("Internal server error.".toError(response.statusCode))
//            }
//
//            if 200 ... 499 ~= response.statusCode {
//                print(response)
//                return Observable.just(response)
//            }
            
            return Observable.error("Sorry,something went wrong. Please try again.".toError(response.statusCode))
        }
    }
}

public extension String {
    func toError(_ code: Int? = 400) -> Error {
        return NSError(domain: "", code: code!, userInfo: [NSLocalizedDescriptionKey: self])
    }
}
