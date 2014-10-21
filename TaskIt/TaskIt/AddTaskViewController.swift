//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Stephane Liu on 10/19/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import UIKit

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
    var task = TaskModel(task: taskTextField.text, subTask: subtaskTextField.text, date: dueDatePicker.date)
    mainVC.taskArray.append(task)
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
