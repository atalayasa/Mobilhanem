//
//  LoginVC.swift
//  02-NavigationController
//
//  Created by Atalay Asa on 9.01.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Giriş"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Devam", style: .plain, target: self, action: #selector(continueBtnPressed))
    }

    @objc func continueBtnPressed(_ sender: Any) {
        print("Right Bar Button Item'a basıldı")
    }
}
