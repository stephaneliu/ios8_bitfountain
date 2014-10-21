//
//  ViewController.swift
//  TaskIt
//
//  Created by Stephane Liu on 10/19/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  var baseArray:[[TaskModel]] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let date1 = Date.from(year: 2014, month: 05, day: 20)
    let date2 = Date.from(year: 2014, month: 03, day: 3)
    let date3 = Date.from(year: 2014, month: 12, day: 13)
    let task1 = TaskModel(task: "Study Ruby", subTask: "Verbs", date: date1, completed: false)
    let task2 = TaskModel(task: "Eat Dinner", subTask: "Burgers", date: date2, completed: false)
    let task3 = TaskModel(task: "Gym", subTask: "Legs Day", date: date3, completed: false)
    
    // refresh info in table view (numberOfRows and cellForRowAtIndexPath (below))
    //tableView.reloadData()
    
    let taskArray = [task1, task2, task3]
    var completedArray = [ TaskModel(task: "Code", subTask: "Task Project", date: date2, completed: true) ]
    
    baseArray = [taskArray, completedArray]
  }
  
  // Method is called everytime ViewController is presented
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    /*
    // Start Closure example #1
    func sortByDate(taskOne: TaskModel, taskTwo: TaskModel) -> Bool {
    return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
    }
    
    taskArray = taskArray.sorted(sortByDate)
    // End Closure example #1
    */
    
    // Start Closure example #2
    // Equivalent to example #1
    baseArray[0] = baseArray[0].sorted {
      (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
      return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
    }
    // End Closure example #2
    
    tableView.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showTaskDetail" {
      let detailsVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
      let indexPath                           = self.tableView.indexPathForSelectedRow()
      // alternatively the following is the same
      // let indexPath = sender as NSIndexPath
      let thisTask              = baseArray[indexPath!.section][indexPath!.row]
      detailsVC.detailTaskModel = thisTask
      detailsVC.mainVC          = self
    }
    else if segue.identifier == "showTaskAdd" {
      let addTaskVC:AddTaskViewController = segue.destinationViewController as AddTaskViewController
      
      addTaskVC.mainVC = self
    }
  }
  
  @IBAction func addTaskButtonPressed(sender: UIBarButtonItem) {
    self.performSegueWithIdentifier("showTaskAdd", sender: self)
  }
  
  // UITableViewDataSource
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return baseArray.count
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return baseArray[section].count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell:TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
    
    let currentTask = baseArray[indexPath.section][indexPath.row]
    
    cell.taskLabel.text = currentTask.task
    cell.descriptionLabel.text = currentTask.subTask
    cell.dateLabel.text = Date.toString(date: currentTask.date)
    
    return cell
  }
  
  //UITableViewDelegate
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    println("row: \(indexPath.row)")
    
    performSegueWithIdentifier("showTaskDetail", sender: self)
  }
  
  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 25
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section == 0 {
      return "To do"
    }
    else {
      return "Completed"
    }
  }
  
}
