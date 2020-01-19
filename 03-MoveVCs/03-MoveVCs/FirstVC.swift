//
//  ViewController.swift
//  03-MoveVCs
//
//  Created by Atalay Aşa on 19.01.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func showBtnPressed() {
        performSegue(withIdentifier: "goToPinkPage", sender: nil)
    }
    
    
    @IBAction func modallyBtnPressed() {
        performSegue(withIdentifier: "modally", sender: nil)
    }

    @IBAction func withoutSegueBtnPressed() {
        let mainSb = UIStoryboard(name: "Main", bundle: Bundle.main)            // 1
        let thirdVC = mainSb.instantiateViewController(identifier: "ThirdVC")   // 2
        show(thirdVC, sender: self)                                             // 3
    }
}

