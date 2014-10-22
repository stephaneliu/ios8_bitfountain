//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Stephane Liu on 10/19/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
  
  var detailTaskModel: TaskModel!
  
  @IBOutlet weak var taskTextField: UITextField!
  @IBOutlet weak var subTaskTextField: UITextField!
  @IBOutlet weak var dueDatePicker: UIDatePicker!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.taskTextField.text    = detailTaskModel.task
    self.subTaskTextField.text = detailTaskModel.subtask
    self.dueDatePicker.date    = detailTaskModel.date
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
    self.navigationController?.popToRootViewControllerAnimated(true)
  }
  
  @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
    let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
    
    detailTaskModel.task      = taskTextField.text
    detailTaskModel.subtask   = subTaskTextField.text
    detailTaskModel.date      = dueDatePicker.date
    detailTaskModel.completed = detailTaskModel.completed
    
    appDelegate.saveContext()
    
    self.navigationController?.popViewControllerAnimated(true)
  }
}
