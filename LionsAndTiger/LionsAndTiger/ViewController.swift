//
//  ViewController.swift
//  LionsAndTiger
//
//  Created by Stephane Liu on 9/18/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var myImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ageLabel: UILabel!
  @IBOutlet weak var breedLabel: UILabel!
  @IBOutlet weak var randomFactLabel: UILabel!
  
  var myTigers:[Tiger]   = []
  var lions:[Lion]       = []
  var lionCubs:[LionCub] = []
  var currentIndex       = 0
  var currentAnimal      = (species: "Tiger", index: 0)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    var tiger   = Tiger()
    tiger.name  = "Tigger"
    tiger.breed = "Bengal"
    tiger.age   = 3
    tiger.image = UIImage(named: "BengalTiger.jpg")
    
    // println("\(tiger.name) breed \(tiger.breed) with image \(tiger.image)")
    nameLabel.text       = tiger.name
    breedLabel.text      = tiger.breed
    ageLabel.text        = "\(tiger.age)"
    myImageView.image    = tiger.image
    randomFactLabel.text = tiger.randomFact()
    
    var tiger2    = Tiger()
    tiger2.name   = "Tigress"
    tiger2.breed  = "Indochinese"
    tiger2.age    = 2
    tiger2.image  = UIImage(named: "IndochineseTiger.jpg")
    
    var tiger3    = Tiger()
    tiger3.name   = "Jacob"
    tiger3.breed  = "Malayian"
    tiger3.age    = 4
    tiger3.image  = UIImage(named: "MalayanTiger.jpg")
    
    var tiger4    = Tiger()
    tiger4.name   = "Spar"
    tiger4.breed  = "Siberian"
    tiger4.age    = 5
    tiger4.image  = UIImage(named: "SiberianTiger.jpg")
    
    myTigers += [tiger, tiger2, tiger3, tiger4]
    
    var lion           = Lion()
    lion.age           = 5
    lion.isAlphaMale   = true
    lion.image         = UIImage(named: "Lion.jpg")
    lion.name          = "Mufasa"
    lion.subSpecies    = "West African"

    var lioness        = Lion()
    lion.age           = 3
    lion.isAlphaMale   = false
    lion.image         = UIImage(named: "Lioness.jpeg")
    lion.name          = "Sarabi"
    lion.subSpecies    = "Barbary"
    
    lions += [lion, lioness]

    var lionCub        = LionCub()
    lionCub.age        = 1
    lionCub.name       = "Simba"
    lion.image         = UIImage(named: "LionCub1.jpg")
    lionCub.subSpecies = "Masai"
    
    var lionCub2       = LionCub()
    lionCub.age        = 1
    lionCub.name       = "Wala"
    lion.image         = UIImage(named: "LionCub2.jpeg")
    lionCub.subSpecies = "Masai"
    
    lionCubs = [lionCub, lionCub2]
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func nextBarButtonPressed(sender: UIBarButtonItem) {
    
    var randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
    
    while currentIndex == randomIndex {
      randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
    }
    
    currentIndex = randomIndex
    let tiger      = myTigers[randomIndex]
    
    UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
      // if self.currentAnimal.species == "Tiger" {
      // else if self.currentAnimal.species == "Lion" {
      // else self.currentAnimal.species == "LionCub" {
        self.nameLabel.text       = tiger.name
        self.breedLabel.text      = tiger.breed
        self.ageLabel.text        = "\(tiger.age)"
        self.myImageView.image    = tiger.image
        self.randomFactLabel.text = tiger.randomFact()
      }, completion: { (finished: Bool) -> () in
    })
  }
  
  func updateAnimal() {
    switch currentAnimal {
    case("Lion", _):
      let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
      currentAnimal   = ("Tiger", randomIndex)
    case("Tiger", _):
      let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
      currentAnimal   = ("LionCub", randomIndex)
    default:
      let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
      currentAnimal   = ("Lion", randomIndex)
    }
  }
  
}

