//
//  ViewController.swift
//  05-TableViewTutorial
//
//  Created by Atalay Aşa on 22.03.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    let scientists: [[String]] = [
//        ["Ali Kuşçu",               "+90(532) 3141 5926"],
//        ["Aziz Sancar",             "+90(532) 5358 9793"],
//        ["Cahit Arf",               "+90(532) 2384 6264"],
//        ["Piri Reis",               "+90(201) 3383 2795"],
//        ["Katip Çelebi",            "+90(201) 0288 4197"],
//        ["Hezarfen Ahmet Çelebi",   "+90(216) 1693 9937"],
//        ["Farabi",                  "+90(533) 2106 0909"],
//        ["Feza Gürsoy",             "+90(533) 2496 0992"],
//        ["Katip Çelebi",            "+90(533) 2076 0940"],
//        ["Piri Reis",               "+90(533) 2286 0989"],
//        ["Akşemsettin",             "+90(533) 2866 0934"]
//    ]
//
    
    let scientists: [String] = ["Ali Kuşçu",
                                "Aziz Sancar",
                                "Cahit Arf",
                                "Piri Reis",
                                "Katip Çelebi",
                                "Hezarfen Ahmet Çelebi",
                                "Farabi",
                                "Feza Gürsoy",
                                "Katip Çelebi",
                                "Piri Reis",
                                "Akşemsettin",
                                "Ali Erdemir",
                                "Hulusi Behçet",
                                "Oktay Sinanoğlu",
                                "Celal Şengör","Afet İnan",
                                "Behram Kurşunoğlu",
                                "Tahsin Özgüç",
                                "Mehmet Öz",
                                "Şerif Mardin"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scientists.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scientistCell")!
        print("cellForRowAt metodu --- section = \(indexPath.section), row = \(indexPath.row)")
        cell.textLabel?.text = scientists[indexPath.row]
        return cell
    }
}

