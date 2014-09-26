//
//  Lion.swift
//  LionsAndTiger
//
//  Created by Stephane Liu on 9/21/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import Foundation
import UIKit

class Lion {
  var age         = 0
  var isAlphaMale = false
  var image       = UIImage(named: "")
  var name        = ""
  var subSpecies  = ""
  
  func roar() {
    println("R-o-a-r!!")
  }
  
  func setToAlphaMale(isAlpha: Bool) {
    self.isAlphaMale = isAlpha
  }
  
  func randomFact() -> String {
    var fact:String
    
    if isAlphaMale {
      fact = "Male Lions have manes"
    }
    else {
      fact = "Female Lioness form the stable social unit and do not tolerate outside females"
    }
    
    return fact
  }
}