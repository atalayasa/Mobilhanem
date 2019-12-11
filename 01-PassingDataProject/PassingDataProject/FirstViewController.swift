//
//  ViewController.swift
//  PassingDataProject
//
//  Created by Atalay Asa on 2.12.2019.
//  Copyright © 2019 Atalay Asa. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var textToTransfer: String = "Hello World!"

    @IBOutlet weak var transferredDataLbl: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToSecondVC(_ sender: Any) {
        let secondVC = SecondViewController()
        secondVC.transferredText = textToTransfer
        present(secondVC, animated: true, completion: nil)
    }

    @IBAction func goToSecondVCSegue(_ sender: Any) {
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let detailVC = segue.destination as? DetailViewController {
                detailVC.email = "atalayasa@windowslive.com"
            }
        } else if segue.identifier == "delegationSegue" {
            if let detailVC = segue.destination as? DetailViewController {
                detailVC.emergencyDelegate = self
            }
        } else if segue.identifier == "closureSegue" {
            if let detailVC = segue.destination as? DetailViewController {
                detailVC.dataTransferClosure = { [weak self] phoneNumber in
                    self?.transferredDataLbl.text = phoneNumber
                }
            }
        }
    }

}

extension FirstViewController: DataTransferable {
    func onEmergencyStatus(phoneNumber: String) {
        print(phoneNumber)
    }
}
