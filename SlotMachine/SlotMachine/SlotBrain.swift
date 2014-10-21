//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Stephane Liu on 9/27/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import Foundation

class SlotBrain {

  class func computeWinnings(slots:[[Slot]]) -> Int {
    var slotsByRows         = unpacSlotsIntoSlotRows(slots)
    var winnings            = 0
    var flushWinCount       = 0
    var threeOfAKindWinCount = 0
    var straightWinCount    = 0
    
    for slotRow in slotsByRows {
      if checkFlush(slotRow) == true {
        println("Flush")
        winnings += 1
        flushWinCount += 1
      }
      
      if checkThreeInARow(slotRow) == true {
        println("Three In A Row")
        winnings += 1
        straightWinCount += 1
      }
      
      if checkThreeOfAKind(slotRow) == true {
        println("Three of kind")
        winnings += 3
        threeOfAKindWinCount += 1
      }
    }
    
    if flushWinCount == 3 {
      println("Royal Flush")
      winnings += 15
    }
    
    if straightWinCount == 3 {
      println("Epic straight")
      winnings += 1000
    }
    
    if threeOfAKindWinCount == 3 {
      println("Epic Three of A Kind")
      winnings += 50
    }
    
    return winnings
  }
  
  // Arrange an array of slots from columns to rows
  class func unpacSlotsIntoSlotRows(slots:[[Slot]]) -> [[Slot]] {
    var slotRow:[Slot]  = []
    var slotRow2:[Slot] = []
    var slotRow3:[Slot] = []
    
    for slotArray in slots {
      for var index = 0; index < slotArray.count; index++ {
        let slot = slotArray[index]
        
        if index == 0 {
          slotRow.append(slot)
        }
        else if index == 1 {
          slotRow2.append(slot)
        }
        else if index == 2 {
          slotRow3.append(slot)
        }
        else {
          println("Error: Unexpected slot in slot array")
        }
        
      }
    }
    var slotByRows:[[Slot]] = [slotRow, slotRow2, slotRow3]
    
    return slotByRows
  }
  
  
  // Helpers
  class func checkFlush(slotRow:[Slot]) -> Bool {
    let slot1   = slotRow[0]
    let slot2   = slotRow[1]
    let slot3   = slotRow[2]
    var isFlush = false
    
    if slot1.isRed == true && slot2.isRed == true && slot3.isRed == true {
      isFlush = true
    }
    else if slot1.isRed == false && slot2.isRed == false && slot3.isRed == false {
      isFlush = true
    }
    
    return isFlush
  }
  
  class func checkThreeInARow(slotRow: [Slot]) -> Bool {
    let slot1   = slotRow[0]
    let slot2   = slotRow[1]
    let slot3   = slotRow[2]
    var isThree = false
    
    if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
      isThree = true
    }
    if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2 {
      isThree = true
    }
    
    return isThree
  }
  
  class func checkThreeOfAKind(slotRow: [Slot]) -> Bool {
    let slot1       = slotRow[0]
    let slot2       = slotRow[1]
    let slot3       = slotRow[2]
    var isThreeKind = false
  
    if slot1.value == slot2.value && slot1.value == slot2.value {
      isThreeKind = true
    }
    
    return isThreeKind
  }
}