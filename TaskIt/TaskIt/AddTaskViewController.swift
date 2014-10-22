//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Stephane Liu on 10/19/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {
  
  var mainVC:ViewController!
  
  @IBOutlet weak var taskTextField: UITextField!
  @IBOutlet weak var subtaskTextField: UITextField!
  @IBOutlet weak var dueDatePicker: UIDatePicker!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func cancelButtonPressed(sender: UIButton) {
    // completion - callback after dismiss is completed
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBAction func addTaskButtonPressed(sender: UIButton) {
    // UIApplication - only one instance per application and is a global context object
    let appDelegate          = (UIApplication.sharedApplication().delegate as AppDelegate)
    let managedObjectContext = appDelegate.managedObjectContext
    let entityDescription    = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: managedObjectContext!)
    let task                 = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext!)
    
    task.task      = taskTextField.text
    task.subtask   = subtaskTextField.text
    task.date      = dueDatePicker.date
    task.completed = false
    
    appDelegate.saveContext()
    
    var request         = NSFetchRequest(entityName: "TaskModel")
    var error:NSError?  = nil
    // & is an address location - a memory optimization feature
    var results:NSArray = managedObjectContext!.executeFetchRequest(request, error: &error)!
    
    for res in results {
      println(res)
    }
    
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
