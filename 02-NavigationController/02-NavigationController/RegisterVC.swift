//
//  RegisterVC.swift
//  02-NavigationController
//
//  Created by Atalay Asa on 9.01.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backBtnPressed() {
        navigationController?.popViewController(animated: true)
    }
}
