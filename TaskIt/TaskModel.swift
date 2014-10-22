//
//  TaskModel.swift
//  TaskIt
//
//  Created by Stephane Liu on 10/21/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import Foundation
import CoreData

// objective-C bridge
@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subtask: String
    @NSManaged var task: String

}
