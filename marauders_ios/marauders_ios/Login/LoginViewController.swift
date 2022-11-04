//
//  LoginViewController.swift
//  marauders_ios
//
//  Created by somsakKaeworasan on 16/2/2565 BE.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loginButton(_ sender: Any) {
        
        let service = Service.login(username: usernameTextField.text!,
                                    password: passwordTextField.text!)
        viewModel
            .login(service: service)
            .subscribe(onNext: { model in

            }, onError: { error in

            })
            .disposed(by: disposeBag)
        
        //self.initRootScene(sceneEnum: .MapScene)
    }
    
    
}
