//
//  ViewController.swift
//  99Balloons
//
//  Created by Stephane Liu on 9/21/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var balloonTitleLabel: UILabel!
  @IBOutlet weak var balloonImageView: UIImageView!
  
  let balloonImages       = ["BerlinTVTower.jpg", "RedBalloon1.jpg", "RedBalloon2.jpg", "RedBalloon3.jpg", "RedBalloon4.jpg"]
  let numberOfBalloons    = 10
  var currentBalloon      = 0
  var balloons:[Balloon]  = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    var lastImageIndex = 0
    for var count=1; count < numberOfBalloons; count++ {
      var balloonImageIndex = 0
      
      while lastImageIndex == balloonImageIndex {
        balloonImageIndex = Int(arc4random_uniform(UInt32(4)))
      }
      
      var balloon = Balloon(count: count, image: UIImage(named: balloonImages[balloonImageIndex]))
      
      balloons.append(balloon)
      lastImageIndex = balloonImageIndex
    }
    
    self.setBalloon(currentBalloon)
    currentBalloon++
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
    if currentBalloon >= (numberOfBalloons - 1) {
      currentBalloon = 0
    }
    
    setBalloon(currentBalloon)
    currentBalloon++
  }
  
  func setBalloon(index: Int) {
    var balloon = balloons[index]
    var balloonName = "Balloons"
    
    if index < 2 { balloonName = "Balloon" }
    
    UIView.transitionWithView(self.view, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
      self.balloonImageView.image = balloon.image
      self.balloonTitleLabel.text = "\(balloon.count) \(balloonName)"
      }, completion: { (finished: Bool) -> () in
    })
  }

}

