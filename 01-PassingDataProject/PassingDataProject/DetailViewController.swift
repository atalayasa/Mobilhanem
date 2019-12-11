//
//  DetailViewController.swift
//  PassingDataProject
//
//  Created by Atalay Asa on 2.12.2019.
//  Copyright © 2019 Atalay Asa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    var email: String = ""
    var emergencyDelegate: DataTransferable?

    var dataTransferClosure: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = email
    }

    @IBAction func emergencyBtnPressed(_ sender: UIButton) {
        dismiss(animated: true) { [weak self] in
            self?.dataTransferClosure?(sender.titleLabel!.text!)
        }
    }

}
