//
//  Tiger.swift
//  LionsAndTiger
//
//  Created by Stephane Liu on 9/18/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
  var age   = 0
  var name  = ""
  var breed = ""
  var image = UIImage(named: "")
  
  func randomFact() -> String {
    let randomNumber = Int(arc4random_uniform(UInt32(3)))
    var randomFact:String
    
    switch randomNumber {
    case 0:
      randomFact = "The Tiger is the biggest species in the cat family"
    case 1:
      randomFact = "Tigers can reach a length of 3.3 meters"
    default:
      randomFact = "A group of tigers is known as an 'ambush' or 'streak'"
    }
    
    return randomFact
  }
}
