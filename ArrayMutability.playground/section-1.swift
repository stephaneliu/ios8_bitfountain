// Playground - noun: a place where people can play

import UIKit

var tigerNames = ["tigger", "Tigress"]
tigerNames.append("Jacob")

println(tigerNames)

tigerNames += ["John", "Jacob"]


tigerNames[0] = "Scar"
tigerNames

// update multiple
tigerNames[0...2] = ["a", "b"]
tigerNames

// insert into array atIndex
tigerNames.insert("Julie", atIndex: 3)
tigerNames

// remove
tigerNames.removeLast()
tigerNames

// remove at index
tigerNames.removeAtIndex(3)
tigerNames

// remove all
tigerNames.removeAll(keepCapacity: false)
tigerNames
