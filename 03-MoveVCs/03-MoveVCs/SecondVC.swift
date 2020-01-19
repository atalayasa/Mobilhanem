//
//  SecondVC.swift
//  03-MoveVCs
//
//  Created by Atalay Aşa on 19.01.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismissBtnPressed() {
        dismiss(animated: true) {
            print("Sayfa dismiss oldu.")
        }
    }

}
