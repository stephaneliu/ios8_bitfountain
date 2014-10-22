//
//  ViewController.swift
//  TaskIt
//
//  Created by Stephane Liu on 10/19/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  let managedObjectContext                                = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
  var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    fetchedResultsController = getFetchedResultsController()
    fetchedResultsController.delegate = self
    fetchedResultsController.performFetch(nil)
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
    return fetchResultsController.sections!.count
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return fetchedResultsController.sections![section].numberOfObjects
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let currentTask   = fetchedResultsController.objectAtIndexPath(indexPath) as TaskModel
    var cell:TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
    
    cell.taskLabel.text        = currentTask.task
    cell.descriptionLabel.text = currentTask.subtask
    cell.dateLabel.text        = Date.toString(date: currentTask.date)
    
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
  
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    let thisTask = fetchedResultsController.objectAtIndexPath(indexPath) as TaskModel
    
    if indexPath.section == 0 {
      thisTask.completed = true
    }
    else {
      thisTask.completed = false
    }
    
    (UIApplication.sharedApplication().delegate as AppDelegate).saveContext()
  }
  
  // NSFetchedResultsControllerDelegate
  func controllerDidChangeContent(controller: NSFetchedResultsController) {
    tableView.reloadData()
  }
  
  
  // Helper
  func taskFetchRequest() -> NSFetchRequest {
    let fetchRequest             = NSFetchRequest(entityName: "TaskModel")
    let sortDescriptor           = NSSortDescriptor(key: "date", ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
    
    return fetchRequest
  }
  
  func getFetchedResultsController() -> NSFetchedResultsController {
    fetchedResultsController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
    return fetchedResultsController
  }
  
  
}
