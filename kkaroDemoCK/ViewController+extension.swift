//
//  ViewController+extension.swift
//  kkaroDemoCK
//
//  Created by Ana Karolina Costa da Silva on 22/10/20.
//

import UIKit
import CoreData

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "taskCell")
        cell.textLabel?.text = "- " + taskList[indexPath.row].taskName!
        return cell
    }
}
