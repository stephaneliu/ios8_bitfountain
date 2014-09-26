// Playground - noun: a place where people can play

import UIKit

// Single line comments

/*

This is a multiline comment

*/


var x         = 10
var y         = 20
var sum       = x + y

var discount  = 0.3
var itemPrice = 30

// this doesn't work because you cannot operate float with a int
// var totalPrice = discount * itemPrice

var realPrice:Double = 30

var totalPrice = discount * realPrice

var changeme = "something"
changeme     = "changed"

// emoji as variable name ??!!
// using ^ + CMD + Space 😒
// can you tell it's not a good idea?
var 😊 = 99
var 😗 = 88

// Typealias - new to swift
// Ability to assign type to a variable
// Not that useful
typealias WholeNumber = Int
typealias NumberWithDecimal = Double

var prices:NumberWithDecimal = 33

// Number Literals
var largeNumber = 1_000_000_000_000

var hiThere = "Hello World"
hiThere = hiThere.uppercaseString
hiThere = hiThere.lowercaseString

// Character
var firstCharacter:Character = "C"

// interpolation
"My character \(firstCharacter)"

// string to int conversion - Int optional
var numberString = "30"
var number       = numberString.toInt()// not yet an Integer
var numberAsInt  = number!// now it's an Integer

var doubleString = "30.0"

// NSString has method to convert string to double
var doubleValue = Double((doubleString as NSString).doubleValue)

// Supports shorthand
numberAsInt += 5
numberAsInt /= 6

//Constants
let myConstant = "Apple"

// myConstant = "changed" // cannot be changed

println("hi there")

let isTVOn = false

if isTVOn == true {
  println("Turn off the television")
}
else {
  println("Watch tv?")
}

// Numeric type conversion

var intValue = 5
var doubleVaue = 0.9

Double(intValue) + doubleValue
Int(doubleValue) + intValue

"5".toInt()!

/*
for var hours = 0; hours < 10; hours++ {
  println("\(hours) Shhhh. I am meditating now.")
}
*/

var wheat = 1
/*
for var i = 0; i < 64; i++ {
  println("Wheat: \(wheat)")
  wheat *= 2
}
*/

var label:String

/*
for var bottles = 99; bottles >= 0; bottles-- {
  if bottles == 0 {
    label = "No more"
  }
  else {
    label = "\(bottles)"
  }
  
  println("\(label) bottles of beer on the wall")
}
*/


// Array - same object types

//var tigerNames:Array<String> // valid instantiation of Array objects
// var tigerNames:[String]  // another valid syntax
var tigerNames = ["Tigger", "Tigress", "Jacob", "Spar"]
tigerNames.isEmpty
tigerNames.count

for tigerAge in 1...3 {
  println("\(tigerAge)")
}

for tigerName in tigerNames {
  let name = tigerName
  println(name)
}

// New in swift not available in Objective C
for (index, tigerName) in enumerate(tigerNames) {
  println("\(index): \(tigerName)")
}


