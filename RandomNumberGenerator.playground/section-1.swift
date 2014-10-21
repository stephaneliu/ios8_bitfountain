// Playground - noun: a place where people can play

import UIKit

var randomNumber = Int(arc4random_uniform(UInt32(3)))

var numbers:[CGFloat] = []

for(var count=0; count < 4; count++) {
  numbers += [CGFloat(arc4random_uniform(UInt32(10)))/10]
}

numbers


var i_num:[Int] = []
for(var count=0; count < 4; count++) {
  i_num += [Int(arc4random_uniform(UInt32(3)))]
}

i_num

