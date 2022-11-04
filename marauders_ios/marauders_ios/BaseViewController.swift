//
//  BaseViewController.swift
//  marauders_ios
//
//  Created by admin on 20/2/2565 BE.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    let sceneDelegate = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func initRootScene(sceneEnum: SceneEnum) {
        
        guard let window = sceneDelegate?.window else {
            return
        }
        
        window.rootViewController = UIStoryboard(name: SceneStoryboardEnum(storyboard: sceneEnum), bundle: nil).instantiateInitialViewController()
        
        UIView.transition(with: window,
                          duration: 0.5,
                          options: [.transitionFlipFromLeft],
                          animations: nil,
                          completion: nil)
    }
    
    
    
    func validEmail(email: String) -> Bool {
        
        let emailPattern = #"^\S+@\S+\.\S+$"#
        
        let result = email.range(
            of: emailPattern,
            options: .regularExpression
        )
        
        return (result != nil)
    }
    
    func alert(title: String, message: String, completion:@escaping (Bool) -> Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            completion(true)
        }))
        
        self.present(alert, animated: true)
    }
    
    private func activityIndicator(style: UIActivityIndicatorView.Style = .medium,
                                   frame: CGRect? = nil,
                                   center: CGPoint? = nil) -> UIActivityIndicatorView {
        
        // 2
        let activityIndicatorView = UIActivityIndicatorView(style: style)
        
        // 3
        if let frame = frame {
            activityIndicatorView.frame = frame
        }
        
        // 4
        if let center = center {
            activityIndicatorView.center = center
        }
        
        // 5
        return activityIndicatorView
    }
    
    func startIndicator(){
        // 1
            let indicatorView = self.activityIndicator(style: .medium,
                                                       center: self.view.center)
        
        indicatorView.color = UIColor.red
            
            // 2
            self.view.addSubview(indicatorView)
            
            // 3
            indicatorView.startAnimating()
    }
    

}
