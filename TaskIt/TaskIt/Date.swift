//
//  Date.swift
//  TaskIt
//
//  Created by Stephane Liu on 10/19/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import Foundation

class Date {
  
  // the '#' allows intellisense have a placeholder for year: [year]
  class func from(#year:Int, month:Int, day:Int) -> NSDate {
    
    var components   = NSDateComponents()
    components.year  = year
    components.month = month
    components.day   = day
    
    var gregorianCalendar = NSCalendar(identifier: NSGregorianCalendar)
    var date = gregorianCalendar.dateFromComponents(components)
    
    return date!
  }
  
  class func toString(#date:NSDate) -> String {
    let dateStringFormatter = NSDateFormatter()
    
    dateStringFormatter.dateFormat = "yyyy-MM-dd"
    let dateString = dateStringFormatter.stringFromDate(date)
    
    return dateString
  }
}
