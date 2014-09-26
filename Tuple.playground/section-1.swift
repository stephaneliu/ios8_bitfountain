// Playground - noun: a place where people can play

import UIKit


var tuple = ("Tigger", "Bangal", 3)
var anotherTuple = (name: "Tigress", breed: "Indochinese Tiger", age: 2)
println(tuple.1)

println(anotherTuple.name)
println(anotherTuple.breed)
println(anotherTuple.age)


// tuple with switch

switch anotherTuple {
case ("Tigress", "Indochinese Tiger", 3):
  println("First case is true")
case("Spar", "Indochinese Tiger", 3):
  println("Second case is true")
case(_, "Indochinese Tiger", _): // ignore first and last property
  println("Third case is true")
default:
  println("Default is occurring")
}
