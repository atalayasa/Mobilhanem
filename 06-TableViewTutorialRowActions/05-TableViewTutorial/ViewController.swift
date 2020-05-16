//
//  ViewController.swift
//  05-TableViewTutorial
//
//  Created by Atalay Aşa on 22.03.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scientists: [String] = ["Ali Kuşçu",
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
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 1
        let title = "Beğen"
        // 2
        let action = UIContextualAction(style: .normal, title: title) { (action, view, completion) in
            // 3
            let cell = self.tableView.cellForRow(at: indexPath)
            cell?.backgroundColor = .systemGreen
            completion(true)
        }
        // 4
        action.image = UIImage(systemName: "heart.fill")
        // 5
        action.backgroundColor = .green
        // 6
        let configuration = UISwipeActionsConfiguration(actions: [action])
        // 7
        return configuration
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let dislikeTitle = "Beğenmekten Vazgeç"
        let dislikeAction = UIContextualAction(style: .normal, title: dislikeTitle) { (action, view, completion) in
            let cell = self.tableView.cellForRow(at: indexPath)
            cell?.backgroundColor = .systemRed
            completion(true)
        }
        dislikeAction.image = UIImage(systemName: "heart.slash.fill")
        dislikeAction.backgroundColor = .systemRed
        
        let deleteTitle = "Listeden sil"
        let deleteAction = UIContextualAction(style: .destructive, title: deleteTitle) { (action, view, completion) in
            // 1
            self.tableView.beginUpdates()
            // 2
            self.scientists.remove(at: indexPath.row)
            // 3
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            // 4
            self.tableView.endUpdates()
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash.fill")
        deleteAction.backgroundColor = .systemOrange
        
        let configuration = UISwipeActionsConfiguration(actions: [dislikeAction, deleteAction])
        return configuration
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

