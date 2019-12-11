//
//  SecondViewController.swift
//  PassingDataProject
//
//  Created by Atalay Asa on 2.12.2019.
//  Copyright © 2019 Atalay Asa. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var transferredTextLabel: UILabel!
    var transferredText: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        transferredTextLabel.text = transferredText
    }
}
