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
  var mainVC:ViewController!
  
  @IBOutlet weak var taskTextField: UITextField!
  @IBOutlet weak var subTaskTextField: UITextField!
  @IBOutlet weak var dueDatePicker: UIDatePicker!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.taskTextField.text    = detailTaskModel.task
    self.subTaskTextField.text = detailTaskModel.subTask
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
    var task = TaskModel(task: taskTextField.text, subTask: subTaskTextField.text, date: dueDatePicker.date, completed: false)
    
    mainVC.baseArray[0][mainVC.tableView.indexPathForSelectedRow()!.row] = task
    self.navigationController?.popViewControllerAnimated(true)
  }
}
