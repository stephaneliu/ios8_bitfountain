//
//  ViewController.swift
//  SlotMachine
//
//  Created by Stephane Liu on 9/23/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // '!' is an implicit unwrapped optional. This means that if the variable, during it lifecycle becomes nil,
  // it should not get rid of the variable
  var firstContainer: UIView!
  var secondContainer: UIView!
  var thirdContainer: UIView!
  var fourthContainer: UIView!
  
  // Information Labels
  var creditsLabel: UILabel!
  var betLabel: UILabel!
  var winnerPaidLabel: UILabel!
  var creditsTitleLabel: UILabel!
  var betTitleLabel: UILabel!
  var winnerPaidTitleLabel: UILabel!
  
  // Buttons in fourth container
  var resetButton: UIButton!
  var betOneButton: UIButton!
  var betMaxButton: UIButton!
  var spinButton: UIButton!
  
  // Top Container
  var titleLabel: UILabel!
  
  // Slots Array
  var slots:[[Slot]] = []
  
  // Stats
  var credits: Int    = 0
  var currentBet: Int = 0
  var winnings: Int   = 0
  
  // Constants  // 'k' - constant
  let kMarginForView:CGFloat = 10.0
  let kSixth:CGFloat         = 1.0/6.0
  let kThird:CGFloat         = 1.0/3.0
  let kNumberOfContainers    = 3
  let kNumberOfSlots         = 3
  let kMarginForSlot:CGFloat = 2
  let kHalf:CGFloat          = 1.0/2.0
  let kEighth:CGFloat        = 1.0/8.0
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //IBActions
  
  func resetButtonPressed(button: UIButton) {
    hardReset()
  }
  
  func betOneButtonPressed(button: UIButton) {
    if credits <= 0 {
      showAlertWithText(header: "No More Credits", message: "Reset Game")
    }
    else {
      if currentBet < 5 {
        currentBet += 1
        credits -= 1
      }
      else {
        // TODO: Refactor UI to only bet 5 or less
        showAlertWithText(message: "You can only bet 5 credits at a time!")
      }
      updateMainView()
    }
  }
  
  func betMaxButtonPressed(button: UIButton) {
    if credits <= 5 {
      showAlertWithText(header: "No Enough Credits", message: "Bet Less")
    }
    else {
      if currentBet < 5 {
        credits -= 5 - currentBet
        currentBet = 5
        updateMainView()
      }
      else {
        showAlertWithText(message: "You can only bet 5 credits at a time!")
      }
    }
  }
  
  func spinButtonPressed(button: UIButton) {
    if currentBet < 1 {
      showAlertWithText(message: "Must bet before spinning")
    }
    else {
      // clear out existing images vice stacking new images on old ones
      removeSlotImageViews()
      slots = Factory.createSlots()
    
      setupSecondContainer(self.secondContainer)
      
      var winningMultiplier = SlotBrain.computeWinnings(slots)
      winnings              = winningMultiplier * currentBet
      credits               += winnings
      currentBet            = 0
    
      updateMainView()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupContainerViews()
    setupFirstContainer(firstContainer)
    setupThirdContainter(thirdContainer)
    setupFourthContainter(fourthContainer)
    
    hardReset()
  }
  
  func setupContainerViews() {
    firstContainer                  = UIView(frame: CGRectMake(view.bounds.origin.x + kMarginForView, view.bounds.origin.y, view.bounds.width - (kMarginForView * 2), view.bounds.height * kSixth))
    firstContainer.backgroundColor  = UIColor.redColor()
    
    secondContainer                 = UIView(frame: CGRectMake(view.bounds.origin.x + kMarginForView, firstContainer.frame.height, view.bounds.width - (kMarginForView * 2), view.bounds.height * (3 * kSixth)))
    secondContainer.backgroundColor = UIColor.blackColor()
    
    thirdContainer                  = UIView(frame: CGRectMake(view.bounds.origin.x + kMarginForView, firstContainer.frame.height + secondContainer.frame.height, view.bounds.width - (kMarginForView * 2), view.bounds.height * kSixth))
    thirdContainer.backgroundColor  = UIColor.lightGrayColor()
    
    fourthContainer                 = UIView(frame: CGRectMake(view.bounds.origin.x + kMarginForView, firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, view.bounds.width - (kMarginForView * 2), view.bounds.height * kSixth))
    fourthContainer.backgroundColor = UIColor.blackColor()
    
    view.addSubview(firstContainer)
    view.addSubview(secondContainer)
    view.addSubview(thirdContainer)
    view.addSubview(fourthContainer)
  }
  
  func setupFirstContainer(containerView: UIView) {
    titleLabel           = UILabel()
    titleLabel.text      = "Super Slots"
    titleLabel.textColor = UIColor.yellowColor()
    titleLabel.font      = UIFont(name: "MarkerFelt-Wide", size: 40)
    
    titleLabel.sizeToFit()
    titleLabel.center    = containerView.center
    
    containerView.addSubview(titleLabel)
  }
  
  func setupSecondContainer(containerView: UIView) {
    for var containerNumber = 0; containerNumber < kNumberOfContainers; ++containerNumber {
      for var slotNumber = 0; slotNumber < kNumberOfSlots; ++slotNumber {
        var slot:Slot
        var slotImageView             = UIImageView()
        
        if slots.count != 0 {
          let slotContainer   = slots[containerNumber]
          slot                = slotContainer[slotNumber]
          slotImageView.image = slot.image
        }
        else {
          slotImageView.image = UIImage(named: "Ace")
        }
        
        slotImageView.backgroundColor = UIColor.yellowColor()
        slotImageView.frame           = CGRectMake(containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird), containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird), containerView.bounds.width * kThird - kMarginForSlot, containerView.bounds.height * kThird - kMarginForSlot)
        containerView.addSubview(slotImageView)
      }
    }
  }
  
  func setupThirdContainter(containerView: UIView) {
    creditsLabel                 = UILabel()
    creditsLabel.text            = "000000"
    creditsLabel.textColor       = UIColor.redColor()
    creditsLabel.font            = UIFont(name: "Menlo-Bold", size: 16)
    creditsLabel.sizeToFit()
    creditsLabel.center          = CGPointMake(containerView.frame.width * kSixth, containerView.frame.height * kThird)
    creditsLabel.textAlignment   = NSTextAlignment.Center
    creditsLabel.backgroundColor = UIColor.darkGrayColor()
    containerView.addSubview(creditsLabel)
    
    betLabel                 = UILabel()
    betLabel.text            = "0000"
    betLabel.textColor       = UIColor.redColor()
    betLabel.font            = UIFont(name: "Menlo-Bold", size: 16)
    betLabel.sizeToFit()
    betLabel.center          = CGPointMake(containerView.frame.width * kSixth * 3, containerView.frame.height * kThird)
    betLabel.textAlignment   = NSTextAlignment.Center
    betLabel.backgroundColor = UIColor.darkGrayColor()
    containerView.addSubview(betLabel)
    
    winnerPaidTitleLabel                 = UILabel()
    winnerPaidTitleLabel.text            = "000000"
    winnerPaidTitleLabel.textColor       = UIColor.redColor()
    winnerPaidTitleLabel.font            = UIFont(name: "Menlo-Bold", size: 16)
    winnerPaidTitleLabel.sizeToFit()
    winnerPaidTitleLabel.center          = CGPointMake(containerView.frame.width * kSixth * 5, containerView.frame.height * kThird)
    winnerPaidTitleLabel.textAlignment   = NSTextAlignment.Center
    winnerPaidTitleLabel.backgroundColor = UIColor.darkGrayColor()
    containerView.addSubview(winnerPaidTitleLabel)
    
    creditsTitleLabel           = UILabel()
    creditsTitleLabel.text      = "Credits"
    creditsTitleLabel.textColor = UIColor.blackColor()
    creditsTitleLabel.font      = UIFont(name: "AmericanTypewriter", size: 14)
    creditsTitleLabel.sizeToFit()
    creditsTitleLabel.center    = CGPointMake(containerView.frame.width * kSixth, containerView.frame.height * kThird * 2)
    containerView.addSubview(creditsTitleLabel)
    
    betTitleLabel           = UILabel()
    betTitleLabel.text      = "Bet"
    betTitleLabel.textColor = UIColor.blackColor()
    betTitleLabel.font      = UIFont(name: "AmericanTypewriter", size: 14)
    betTitleLabel.sizeToFit()
    betTitleLabel.center    = CGPointMake(containerView.frame.width * kSixth * 3, containerView.frame.height * kThird * 2)
    containerView.addSubview(betTitleLabel)
    
    winnerPaidLabel           = UILabel()
    winnerPaidLabel.text      = "Winner Paid"
    winnerPaidLabel.textColor = UIColor.blackColor()
    winnerPaidLabel.font      = UIFont(name: "AmericanTypewriter", size: 14)
    winnerPaidLabel.sizeToFit()
    winnerPaidLabel.center    = CGPointMake(containerView.frame.width * kSixth * 5, containerView.frame.height * kThird * 2)
    containerView.addSubview(winnerPaidLabel)
  }
  
  func setupFourthContainter(containerView: UIView) {
    resetButton                  = UIButton()
    resetButton.setTitle("Reset", forState: UIControlState.Normal)
    resetButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    // '?' - titleLabel is optionalal is available once a title is set (setTitle) but will need to use ? to access it
    resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
    resetButton.backgroundColor  = UIColor.lightGrayColor()
    resetButton.sizeToFit()
    resetButton.center           = CGPointMake(containerView.frame.width * kEighth, containerView.frame.height * kHalf)
    // ':' in resetButtonPressed: is the syntax for complier to pass 1+ params to method intercepting action
    resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    containerView.addSubview(resetButton)
    
    
    betOneButton                  = UIButton()
    betOneButton.setTitle("Bet One", forState: UIControlState.Normal)
    betOneButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    betOneButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
    betOneButton.backgroundColor  = UIColor.greenColor()
    betOneButton.sizeToFit()
    betOneButton.center           = CGPointMake(containerView.frame.width * kEighth * 3, containerView.frame.height * kHalf)
    betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    containerView.addSubview(betOneButton)
    
    betMaxButton = UIButton()
    betMaxButton.setTitle("Bet Max", forState: UIControlState.Normal)
    betMaxButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    betMaxButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
    betMaxButton.backgroundColor = UIColor.lightGrayColor()
    betMaxButton.sizeToFit()
    betMaxButton.center = CGPointMake(containerView.frame.width * kEighth * 5, containerView.frame.height * kHalf)
    betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    containerView.addSubview(betMaxButton)
    
    spinButton = UIButton()
    spinButton.setTitle("Spin", forState: UIControlState.Normal)
    spinButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    spinButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
    spinButton.backgroundColor = UIColor.greenColor()
    spinButton.sizeToFit()
    spinButton.center = CGPointMake(containerView.frame.width * kEighth * 7, containerView.frame.height * kHalf)
    spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    containerView.addSubview(spinButton)
  }
  
  
  // Helpers
  func removeSlotImageViews() {
    if self.secondContainer != nil {
    
      // ? - optional, ! - unwrap in case the secondContainer is nil even though it is in conditional
      let container:UIView? = self.secondContainer!
      let subViews:Array?   = container!.subviews
      
      for view in subViews! {
        view.removeFromSuperview()
      }
      
    }
  }
  
  func hardReset() {
    removeSlotImageViews()
    
    // Clear out array keeping capicity (don't deallocate memory)
    slots.removeAll(keepCapacity: true)

    credits    = 50
    winnings   = 0
    currentBet = 0
    
    setupSecondContainer(secondContainer)
    updateMainView()
  }
  
  func updateMainView() {
    creditsLabel.text         = "\(credits)"
    betLabel.text             = "\(currentBet)"
    winnerPaidTitleLabel.text = "\(winnings)"
  }
  
  func showAlertWithText(header: String = "Warning", message: String) {
    var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    // allow for dismissal of alert
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
    // completion - callback hook
    presentViewController(alert, animated: true, completion: nil)
  }

  
}
