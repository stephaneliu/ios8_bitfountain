//
//  LionCub.swift
//  LionsAndTiger
//
//  Created by Stephane Liu on 9/23/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import Foundation

// LionCub is subclass of Lion

class LionCub:Lion {

  var isMale = false

  func rubBelly() {
    println("PRRRRRRRRRRRR")
  }
  
  override func roar() {
    super.roar()
    println("Grrrrr")
  }
  
  override func randomFact() -> String {
    var fact:String
    
    if isMale {
      fact = "Cubs are usually hidden in bush for six weeks"
    }
    else {
      fact = "Cubs begin eating meat at six weeks"
    }
    return fact
  }
}
