//
//  ViewController.swift
//  kkaroDemoCK
//
//  Created by Ana Karolina Costa da Silva on 22/10/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var taskList = Task.fetchAll()
    var enteredTask = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        addNewTask()
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        deleteAllTask()
    }
    
    private func addNewTask() {
        self.enteredTask = taskTextField.text!
        saveTask(named: self.enteredTask)
        self.taskList = Task.fetchAll()
        tableView.reloadData()
        taskTextField.text = ""
    }
    
    private func deleteAllTask() {
        Task.deleteAll()
        taskList = Task.fetchAll()
        tableView.reloadData()
    }
    
    private func saveTask(named name: String) {

        let entity = NSEntityDescription.entity(forEntityName: "Task", in: AppDelegate.viewContext)!

        let task = NSManagedObject(entity: entity, insertInto: AppDelegate.viewContext)
                task.setValue(name, forKey: "taskName")
                do {
                    try AppDelegate.viewContext.save()
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
    }
    
}


