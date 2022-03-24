//
//  ViewController.swift
//  homework_login_viewcode
//
//  Created by Victor Pizetta on 24/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    let loginScreen = LoginScreen()
    
    override func loadView() {
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .goDevPurple
    }
}

