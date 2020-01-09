//
//  MainVC.swift
//  02-NavigationController
//
//  Created by Atalay Asa on 8.01.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ana Sayfa"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(menuBtnPressed))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "İlk Ekran", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(logoutBtnPressed))
    }

    @objc func menuBtnPressed(_ sender: Any) {
        print("Menu Item'a basıldı")
    }

    @objc func logoutBtnPressed(_ sender: Any) {
        print("Logout Item'a basıldı")
    }

    @IBAction func girisYapBtnPressed() {
        let login = LoginVC()
        navigationController?.pushViewController(login, animated: true)
    }

    @IBAction func kayitOlBtnPressed() {
        let register = RegisterVC()
        navigationController?.pushViewController(register, animated: true)
    }
}
