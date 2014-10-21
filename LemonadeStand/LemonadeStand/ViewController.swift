//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Stephane Liu on 9/29/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // Top level containers
  var firstContainer: UIView!
  var secondContainer: UIView!
  var thirdContainer: UIView!
  var fourthContainer: UIView!
  
  // first container
  var moneyRemainingLabel: UILabel!
  var lemonsRemainingLabel: UILabel!
  var iceRemainingLabel: UILabel!
  var weatherImageView: UIImageView!
  
  // second container
  var lemonAmountLabel: UILabel!
  var iceAmountLabel: UILabel!
  var decreaseLemon: UIButton!
  var increaseLemon: UIButton!
  var decreaseIce: UIButton!
  var increaseIce: UIButton!
  
  // third container
  var mixLemonAmountLabel:UILabel!
  var mixIceAmountLabel:UILabel!
  var decreaseMixLemons:UIButton!
  var increaseMixLemons:UIButton!
  var decreaseMixIce:UIButton!
  var increaseMixIce:UIButton!
  
  // fourth container
  var startButton: UIButton!
  
  // stats
  var moneyRemaining:Int  = 0
  var lemonsRemaining:Int = 0
  var iceRemaining:Int    = 0
  var lemonPurchasing:Int = 0
  var icePurchasing:Int   = 0
  var lemonMixing:Int     = 0
  var iceMixing:Int       = 0
  var dailySales:Int      = 0
  var todayWeather:String = ""
  
  // Constants
  let kMarginForView:CGFloat     = 10.0
  let kMarginForViewPlus:CGFloat = 18.0
  let kNinth:CGFloat             = 1.0/9.0
  let kEigth:CGFloat             = 1.0/8.0
  let kSeventh:CGFloat           = 1.0/7.0
  let kSixth:CGFloat             = 1.0/6.0
  let kFifth:CGFloat             = 1.0/5.0
  let kFourth:CGFloat            = 1.0/4.0
  let kThird:CGFloat             = 1.0/3.0
  let kHalf:CGFloat              = 1.0/2.0
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupContainerViews()
    setupFirstContainer(firstContainer)
    setupSecondContainer(secondContainer)
    setupThirdContainer(thirdContainer)
    setupFourthContainer(fourthContainer)
    resetStatValues()
  }
  
  func setupContainerViews() {
    firstContainer  = UIView(frame: CGRectMake(view.bounds.origin.x + kMarginForView, view.bounds.origin.y, view.bounds.width - (kMarginForView * 2), view.bounds.height * kFourth))
    //firstContainer.backgroundColor = UIColor.grayColor()
    secondContainer = UIView(frame: CGRectMake(view.bounds.origin.x + kMarginForView, firstContainer.frame.height, view.bounds.width - (kMarginForView * 2), view.bounds.height * kFourth))
    //secondContainer.backgroundColor = UIColor.yellowColor()
    thirdContainer  = UIView(frame: CGRectMake(view.bounds.origin.x + kMarginForView, firstContainer.frame.height + secondContainer.frame.height, view.bounds.width - (kMarginForView * 2), view.bounds.height * kFourth))
    fourthContainer = UIView(frame: CGRectMake(view.bounds.origin.x + kMarginForView, firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, view.bounds.width - (kMarginForView * 2), view.bounds.height * kFourth))
    //fourthContainer.backgroundColor = UIColor.lightGrayColor()
    
    view.addSubview(firstContainer)
    view.addSubview(secondContainer)
    view.addSubview(thirdContainer)
    view.addSubview(fourthContainer)
  }
  
  func setupFirstContainer(containerView: UIView) {
    var y_point          = containerView.bounds.origin.y + kMarginForViewPlus
    var titleLabel       = UILabel()
    weatherImageView     = UIImageView()
    titleLabel           = UILabel(frame: CGRectMake(containerView.bounds.origin.x + kMarginForView, y_point, containerView.bounds.width/2, containerView.bounds.height))
    titleLabel.text      = "You Have:"
    titleLabel.textColor = UIColor.redColor()
    titleLabel.sizeToFit()
    
    moneyRemainingLabel           = UILabel(frame: CGRectMake(containerView.bounds.width/2, y_point, containerView.bounds.width, containerView.bounds.height * kFifth))
    moneyRemainingLabel.text      = "$10"
    moneyRemainingLabel.textColor = UIColor.greenColor()
    
    y_point += moneyRemainingLabel.frame.height
    
    weatherImageView.frame = CGRectMake(containerView.bounds.origin.x, y_point, containerView.bounds.width/2, containerView.bounds.height * (kHalf + kFifth))
    
    lemonsRemainingLabel      = UILabel(frame: CGRectMake(containerView.bounds.width/2, y_point, containerView.bounds.width, containerView.bounds.height * kFifth))
    lemonsRemainingLabel.text = "1 Lemons"
    
    y_point += lemonsRemainingLabel.frame.height
    
    iceRemainingLabel      = UILabel(frame: CGRectMake(containerView.bounds.width/2, y_point, containerView.bounds.width, containerView.bounds.height * kFifth))
    iceRemainingLabel.text = "1 Ice Cubes"
    
    containerView.addSubview(titleLabel)
    containerView.addSubview(moneyRemainingLabel)
    containerView.addSubview(weatherImageView)
    containerView.addSubview(lemonsRemainingLabel)
    containerView.addSubview(iceRemainingLabel)
  }
  
  func setupSecondContainer(containerView: UIView) {
    var x_point = containerView.bounds.origin.x + kMarginForView
    var y_point = containerView.bounds.origin.y
    
    var instructionLabel       = UILabel(frame: CGRectMake(x_point, y_point, containerView.bounds.width, containerView.bounds.height * kFifth))
    instructionLabel.text      = "Step 1: Purchase Supplies"
    instructionLabel.textColor = UIColor.blueColor()
    
    x_point = containerView.bounds.origin.x
    y_point += instructionLabel.frame.height + (containerView.bounds.height * kNinth)
    
    var lemonCostLabel             = UILabel(frame: CGRectMake(x_point, y_point, containerView.bounds.width/2, containerView.bounds.height * kFifth))
    lemonCostLabel.text            = "Lemons for $2:"
    lemonCostLabel.textAlignment   = NSTextAlignment.Right
    
    x_point = containerView.bounds.width/2
    
    decreaseLemon = UIButton(frame: CGRectMake(x_point, y_point, (containerView.bounds.width/2) * kFourth, containerView.bounds.height * kFifth))
    decreaseLemon.setTitle("-", forState: UIControlState.Normal)
    decreaseLemon.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    decreaseLemon.addTarget(self, action: "decreaseLemonPurchaseButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    
    x_point += decreaseLemon.frame.width
    
    lemonAmountLabel                 = UILabel(frame: CGRectMake(x_point, y_point, (containerView.bounds.width/2) * kFourth, containerView.bounds.height * kFifth))
    lemonAmountLabel.textAlignment   = NSTextAlignment.Center
    lemonAmountLabel.text            = "0"
    
    x_point += lemonAmountLabel.frame.width
    
    increaseLemon = UIButton(frame: CGRectMake(x_point, y_point, (containerView.bounds.width/2) * kFourth, containerView.bounds.height * kFifth))
    increaseLemon.setTitle("+", forState: UIControlState.Normal)
    increaseLemon.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    increaseLemon.addTarget(self, action: "buyMoreLemonButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    
    // Next row
    x_point = containerView.bounds.origin.x
    y_point += lemonCostLabel.frame.height + (containerView.bounds.height * kNinth)
    
    var iceCostLabel             = UILabel(frame: CGRectMake(x_point, y_point, containerView.bounds.width/2, containerView.bounds.height * kFifth))
    iceCostLabel.text            = "Ice Cubes for $1:"
    iceCostLabel.textAlignment   = NSTextAlignment.Right
    
    x_point += containerView.bounds.width/2
    
    decreaseIce = UIButton(frame: CGRectMake(x_point, y_point, (containerView.bounds.width/2) * kFourth, containerView.bounds.height * kFifth))
    decreaseIce.setTitle("-", forState: UIControlState.Normal)
    decreaseIce.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    decreaseIce.addTarget(self, action: "decreaseIcePurchaseButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    
    x_point += decreaseIce.frame.width
    
    iceAmountLabel               = UILabel(frame: CGRectMake(x_point, y_point, (containerView.bounds.width/2) * kFourth, containerView.bounds.height * kFifth))
    iceAmountLabel.textAlignment = NSTextAlignment.Center
    iceAmountLabel.text = "0"
    
    x_point += iceAmountLabel.frame.width
    
    increaseIce = UIButton(frame: CGRectMake(x_point, y_point, (containerView.bounds.width/2) * kFourth, containerView.bounds.height * kFifth))
    increaseIce.setTitle("+", forState: UIControlState.Normal)
    increaseIce.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    increaseIce.addTarget(self, action: "buyMoreIceButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    
    containerView.addSubview(instructionLabel)
    containerView.addSubview(lemonCostLabel)
    containerView.addSubview(iceCostLabel)
    
    containerView.addSubview(decreaseLemon)
    containerView.addSubview(lemonAmountLabel)
    containerView.addSubview(increaseLemon)
    
    containerView.addSubview(decreaseIce)
    containerView.addSubview(iceAmountLabel)
    containerView.addSubview(increaseIce)
  }
  
  func setupThirdContainer(containerView: UIView) {
    
    var maxWidth  = containerView.bounds.width
    var maxHeight = containerView.bounds.height
    
    var x_point   = containerView.bounds.origin.x + kMarginForView
    var y_point   = containerView.bounds.origin.y
    
    var instructionLabel       = UILabel(frame: CGRectMake(x_point, y_point, maxWidth, maxHeight * kFifth))
    instructionLabel.text      = "Step 2: Mix your lemondade."
    instructionLabel.textColor = UIColor.blueColor()
    
    // Next row
    y_point += instructionLabel.bounds.height
    
    var instructionDetailsLabel = UILabel()
    instructionDetailsLabel.font = UIFont(name: instructionDetailsLabel.font.fontName, size: 12)
    instructionDetailsLabel.text = "Do your customers prefer more \nice or more lemons today?"
    instructionDetailsLabel.numberOfLines = 0
    instructionDetailsLabel.sizeToFit()
    instructionDetailsLabel.center = CGPointMake(maxWidth/2, y_point + (instructionDetailsLabel.bounds.height/2))
    
    // Next row
    x_point = containerView.bounds.origin.x
    y_point += instructionDetailsLabel.bounds.height * (kHalf + kThird)
    
    var lemonLabel           = UILabel(frame: CGRectMake(x_point, y_point, maxWidth/2, maxHeight * kFifth))
    lemonLabel.text          = "Lemons:"
    lemonLabel.textAlignment = NSTextAlignment.Right
    
    x_point += maxWidth/2
    
    decreaseMixLemons = UIButton(frame: CGRectMake(x_point, y_point, (maxWidth/2) * kFourth, maxHeight * kFifth))
    decreaseMixLemons.setTitle("-", forState: UIControlState.Normal)
    decreaseMixLemons.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    decreaseMixLemons.addTarget(self, action: "decreaseLemonMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    
    x_point += decreaseMixLemons.frame.width
    
    mixLemonAmountLabel               = UILabel(frame: CGRectMake(x_point, y_point, (maxWidth/2) * kFourth, maxHeight * kFifth))
    mixLemonAmountLabel.text          = "0"
    mixLemonAmountLabel.textAlignment = NSTextAlignment.Center
    
    x_point += mixLemonAmountLabel.frame.width
    
    increaseMixLemons = UIButton(frame: CGRectMake(x_point, y_point, (maxWidth/2) * kFourth, maxHeight * kFifth))
    increaseMixLemons.setTitle("+", forState: UIControlState.Normal)
    increaseMixLemons.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    increaseMixLemons.addTarget(self, action: "increaseLemonMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    
    // Next row
    x_point = containerView.bounds.origin.x
    y_point += lemonLabel.frame.height + (containerView.bounds.height * kNinth)
    
    var iceLabel = UILabel(frame: CGRectMake(x_point, y_point, maxWidth/2, maxHeight * kSixth))
    iceLabel.text = "Ice Cubes:"
    iceLabel.textAlignment = NSTextAlignment.Right
    
    x_point += maxWidth/2
    
    decreaseMixIce = UIButton(frame: CGRectMake(x_point, y_point, maxWidth/2 * kFourth, maxHeight * kFifth))
    decreaseMixIce.setTitle("-", forState: UIControlState.Normal)
    decreaseMixIce.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    decreaseMixIce.addTarget(self, action: "decreaseIceMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    
    x_point += decreaseMixIce.frame.width
    
    mixIceAmountLabel               = UILabel(frame: CGRectMake(x_point, y_point, (maxWidth/2) * kFourth, maxHeight * kFifth))
    mixIceAmountLabel.text          = "0"
    mixIceAmountLabel.textAlignment = NSTextAlignment.Center
    
    x_point += mixIceAmountLabel.frame.width
    
    increaseMixIce = UIButton(frame: CGRectMake(x_point, y_point, maxWidth/2 * kFourth, maxHeight * kFifth))
    increaseMixIce.setTitle("+", forState: UIControlState.Normal)
    increaseMixIce.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    increaseMixIce.addTarget(self, action: "increaseIceMixButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    
    containerView.addSubview(instructionLabel)
    containerView.addSubview(instructionDetailsLabel)
    containerView.addSubview(lemonLabel)
    containerView.addSubview(decreaseMixLemons)
    containerView.addSubview(mixLemonAmountLabel)
    containerView.addSubview(increaseMixLemons)
    containerView.addSubview(iceLabel)
    containerView.addSubview(decreaseMixIce)
    containerView.addSubview(mixIceAmountLabel)
    containerView.addSubview(increaseMixIce)
  }
  
  func setupFourthContainer(containerView: UIView) {
    var maxWidth  = containerView.bounds.width
    var maxHeight = containerView.bounds.height
    
    var x_point   = containerView.bounds.origin.x + kMarginForView
    var y_point   = containerView.bounds.origin.y
    
    var instructionLabel       = UILabel(frame: CGRectMake(x_point, y_point, maxWidth, maxHeight * kFifth))
    instructionLabel.text      = "Step 3: Start selling you brew"
    instructionLabel.textColor = UIColor.blueColor()
    
    y_point += instructionLabel.bounds.height
    
    var instructionLabelDetails           = UILabel()
    instructionLabelDetails.font          = UIFont(name: instructionLabelDetails.font.fontName, size: 12)
    instructionLabelDetails.text          = "At the end of the day you will either \nmake or lose money. If you don't have \nenough money to buy new inventory \nthen game ends."
    instructionLabelDetails.numberOfLines = 0
    instructionLabelDetails.sizeToFit()
    instructionLabelDetails.center = CGPointMake(maxWidth/2, y_point + (instructionLabelDetails.bounds.height/2))
    
    // next row
    y_point += instructionLabelDetails.frame.height + kMarginForView
    
    startButton = UIButton(frame: CGRectMake(maxWidth * kThird, y_point, maxWidth * kThird, maxHeight * kThird))
    startButton.setTitle("Start Day", forState: UIControlState.Normal)
    startButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    startButton.backgroundColor = UIColor.yellowColor()
    startButton.addTarget(self, action: "startButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    
    containerView.addSubview(instructionLabel)
    containerView.addSubview(instructionLabelDetails)
    containerView.addSubview(startButton)
  }
  
  func resetStatValues() {
    moneyRemaining  = 10
    lemonsRemaining = 0
    iceRemaining    = 0
    lemonPurchasing = 0
    icePurchasing   = 0
    lemonMixing     = 0
    iceMixing       = 0
    
    updateMainView()
  }
  
  func updateMainView() {
    moneyRemainingLabel.text  = "$\(moneyRemaining)"
    lemonsRemainingLabel.text = "\(lemonsRemaining) Lemons"
    iceRemainingLabel.text    = "\(iceRemaining) Ice Cubes"
    lemonAmountLabel.text     = "\(lemonPurchasing)"
    iceAmountLabel.text       = "\(icePurchasing)"
    mixLemonAmountLabel.text  = "\(lemonMixing)"
    mixIceAmountLabel.text    = "\(iceMixing)"
  }
  
  func buyMoreLemonButtonPressed(button: UIButton) {
    if moneyRemaining < 2 {
      showAlertWithText(message: "You do not have enough money")
    }
    else {
      lemonsRemaining += 1
      moneyRemaining  -= 2
      lemonPurchasing += 1
      updateMainView()
    }
  }
  
  func decreaseLemonPurchaseButtonPressed(button: UIButton) {
    if lemonsRemaining > 1 {
      lemonsRemaining -= 1
      moneyRemaining += 2
      lemonPurchasing -= 1
    }
    // update lemon mix
    if lemonMixing > lemonPurchasing {
      lemonMixing = lemonPurchasing
    }
    
    updateMainView()
  }
  
  func buyMoreIceButtonPressed(button: UIButton) {
    if moneyRemaining < 1 {
      showAlertWithText(message: "You do not have enough money")
    }
    else {
      iceRemaining += 1
      moneyRemaining -= 1
      icePurchasing += 1
      updateMainView()
    }
  }
  
  func decreaseIcePurchaseButtonPressed(button: UIButton) {
    if iceRemaining > 1 {
      iceRemaining -= 1
      moneyRemaining += 1
      icePurchasing -= 1
    }
    //update ice mix
    if iceMixing > icePurchasing {
      iceMixing = icePurchasing
    }
    updateMainView()
  }
  
  func increaseLemonMixButtonPressed(button: UIButton) {
    if lemonMixing < lemonPurchasing {
      lemonMixing += 1
      lemonsRemaining -= 1
      updateMainView()
    }
  }
  
  func decreaseLemonMixButtonPressed(button: UIButton) {
    if lemonMixing > 0 {
      lemonMixing -= 1
      lemonsRemaining += 1
      updateMainView()
    }
  }
  
  func increaseIceMixButtonPressed(button: UIButton) {
    if iceMixing < icePurchasing {
      iceMixing += 1
      iceRemaining -= 1
      updateMainView()
    }
  }
  
  func decreaseIceMixButtonPressed(button: UIButton) {
    if iceMixing > 0 {
      iceMixing -= 1
      iceRemaining += 1
      updateMainView()
    }
  }
  
  func showAlertWithText(header: String = "Warning", message: String) {
    var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    // allow dismissal
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
    // completion callback hoook
    presentViewController(alert, animated: true, completion: nil)
  }
  
  func startButtonPressed(button: UIButton) {
    // reset daily sales
    dailySales = 0
    
    if lemonMixing > 0 && iceMixing > 0 {
      setWeather()
      
      let lemonadeMixRatio                      = calculateLemonadeRatio()
      let customerCount                         = generateCustomers()
      let lemonadeMixRatioPreferences:[CGFloat] = randomMixRatio(customerCount)
      
      showAlertWithText(header: "Earnings Summary", message: earningsSummary(lemonadeMixRatio, lemonadeMixRatioPreferences: lemonadeMixRatioPreferences))
      newDay(dailySales)
    }
    else {
      showAlertWithText(message: "You must mix at least one lemon and one ice cube")
    }
  }
  
  func setWeather() {
    var possibleWeather:[String] = ["cold", "mild", "warm"]
    todayWeather                 = possibleWeather[Int(arc4random_uniform(UInt32(2)))]
    weatherImageView.image       = UIImage(named: todayWeather)
  }
  
  func generateCustomers() -> Int {
    var customers = Int(arc4random_uniform(UInt32(10))) + factorWeather()
    
    if customers < 1 {
      customers = 1
    }
    
    return customers
  }
  
  func factorWeather() -> Int {
    var customers = 0
    
    switch todayWeather {
    case "cold":
      customers = -3
    case "warm":
      customers = 4
    default:
      customers = 0
    }
    
    return customers
  }
  
  func calculateLemonadeRatio() -> CGFloat {
    var ratio = CGFloat(lemonMixing) / CGFloat(iceMixing)
    return ratio
  }
  
  func randomMixRatio(customerCount: Int) -> [CGFloat] {
    var mixRatio:[CGFloat] = []
    
    for var count=0; count < customerCount; count++ {
      mixRatio += [CGFloat(arc4random_uniform(UInt32(10)))/10]
    }
    
    return mixRatio
  }
  
  func earningsSummary(lemonadeMixRatio: CGFloat, lemonadeMixRatioPreferences: [CGFloat]) -> NSString {
    var earningsMessage = "You made \(mixType(lemonadeMixRatio, customer: false)) lemonade \n"
    earningsMessage += "There were \(lemonadeMixRatioPreferences.count) customers: \n"
    
    for var preference = 0; preference < lemonadeMixRatioPreferences.count; preference++ {
      var customerMixPreference = lemonadeMixRatioPreferences[preference]
      
      earningsMessage += "Customer wanted \(mixType(customerMixPreference, customer: true))."
      
      if calculateEarning(lemonadeMixRatio, customerPreference: customerMixPreference) > 0 {
        earningsMessage += "Paid! \n"
      }
      else {
        earningsMessage += "No sale \n"
      }
    }
    earningsMessage += "You earned $\(dailySales) today"
    
    return earningsMessage
  }
  
  func calculateEarning(lemonadeMixRatio: CGFloat, customerPreference: CGFloat) -> Int {
    var sold_amount = 0
    var made        = mixType(lemonadeMixRatio, customer: false)
    var want        = mixType(customerPreference, customer: true)
    
    if want == made {
      sold_amount = 1
    }
    
    if sold_amount > 0 {
      dailySales += 1
    }
    
    return sold_amount
  }
  
  func mixType(ratio: CGFloat, customer: Bool) -> String {
    var type = ""
    if acidicMix(ratio, customer: customer) == true {
      type = "acidic"
    }
    else if neutralMix(ratio, customer: customer) == true {
      type = "neutral"
    }
    else {
      type = "diluted"
    }
    return type
  }
  
  func acidicMix(ratio: CGFloat, customer: Bool) -> Bool {
    var acidic = false
    
    if customer {
      if ratio <= 0.4 {
        acidic = true
      }
    }
    else {
      if ratio > 1 {
        acidic = true
      }
    }
    return acidic
  }
  
  func neutralMix(ratio: CGFloat, customer: Bool) -> Bool {
    var neutral = false
    
    if customer {
      if ratio > 0.4 && ratio <= 0.6 {
        neutral = true
      }
    }
    else {
      if ratio == 1 {
        neutral = true
      }
    }
    return neutral
  }
  
  func dilutedMix(ratio: CGFloat, customer: Bool) -> Bool {
    var diluted = false
    if customer {
      if ratio > 0.6 {
        diluted = true
      }
    }
    if ratio < 1 {
      diluted = true
    }
    return diluted
  }
  
  func newDay(lastSalesAmount: Int) {
    moneyRemaining  += lastSalesAmount
    lemonsRemaining = 0
    iceRemaining    = 0
    lemonPurchasing = 0
    icePurchasing   = 0
    lemonMixing     = 0
    iceMixing       = 0
    
    updateMainView()
  }
  
}

